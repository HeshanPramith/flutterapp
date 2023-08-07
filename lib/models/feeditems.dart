import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/constants.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RSSFeedItemsScreen extends StatefulWidget {
  final RssFeed feed;

  const RSSFeedItemsScreen({Key? key, required this.feed}) : super(key: key);

  @override
  State<RSSFeedItemsScreen> createState() => _RSSFeedItemsScreenState();
}

class _RSSFeedItemsScreenState extends State<RSSFeedItemsScreen> {
  launchJobLink(String jobLink) async {
    if (await canLaunchUrl(jobLink as Uri)) {
      await launchUrl(jobLink as Uri);
    } else {
      throw 'Could not launch $jobLink';
    }
  }

  // ignore: unused_field
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  String searchQuery = '';
  String selectedLocation = '';

  List<RssItem> get filteredItems {
    if (_showFavoritesOnly) {
      return (widget.feed.items ?? []).where((item) {
        final itemTitle = item.title?.toString() ?? '';
        return _favoriteItems.contains(itemTitle);
      }).toList();
    } else {
      if (searchQuery.isEmpty && selectedLocation.isEmpty) {
        return widget.feed.items ?? [];
      } else {
        return (widget.feed.items ?? []).where((item) {
          final title = item.title?.toString().toLowerCase() ?? '';
          final description = item.description?.toString().toLowerCase() ?? '';
          final location = item.dc?.coverage.toString().toLowerCase() ??
              ''; // Replace "location" with the actual field in your RssItem class representing the location.

          bool matchesSearchQuery = title.contains(searchQuery.toLowerCase()) ||
              description.contains(searchQuery.toLowerCase());
          bool matchesSelectedLocation = selectedLocation.isEmpty ||
              location.contains(selectedLocation.toLowerCase());

          return matchesSearchQuery && matchesSelectedLocation;
        }).toList();
      }
    }
  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  late SharedPreferences _preferences;
  List<String> _favoriteItems = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _favoriteItems = _preferences.getStringList('favoriteItems') ?? [];
    });
  }

  void _toggleFavoriteItem(RssItem item) {
    final itemTitle = item.title?.toString() ?? '';
    setState(() {
      if (_favoriteItems.contains(itemTitle)) {
        _favoriteItems.remove(itemTitle);
      } else {
        _favoriteItems.add(itemTitle);
      }
      _preferences.setStringList('favoriteItems', _favoriteItems);
    });
  }

  bool _isItemFavorite(RssItem item) {
    final itemTitle = item.title?.toString() ?? '';
    return _favoriteItems.contains(itemTitle);
  }

  bool _showFavoritesOnly = false;

  void toggleShowFavoritesOnly() {
    setState(() {
      _showFavoritesOnly = !_showFavoritesOnly;
    });
  }

  List<String> getUniqueLocations() {
    final locations = widget.feed.items!
        .map((item) => item.dc?.coverage?.toString().toLowerCase() ?? '')
        .toSet()
        .toList();
    locations.sort();
    return locations;
  }

  void _showLocationBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.75,
          padding: const EdgeInsets.only(
            bottom: 15.0,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 247, 66, 66),
                Color.fromARGB(255, 100, 1, 1),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(
                40.0,
              ),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Select Your Location',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white10),
                          ),
                        ),
                        child: ListTile(
                          title: const Text(
                            'All Locations',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onTap: () {
                            setState(
                              () {
                                selectedLocation = '';
                              },
                            );
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      for (String location in getUniqueLocations())
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white10),
                            ),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    location.capitalize(),
                                    style: TextStyle(
                                      color: location == selectedLocation
                                          ? Colors.white
                                          : Colors.white70,
                                      fontSize: 15.0,
                                      fontWeight: location == selectedLocation
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (location == selectedLocation)
                                  const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedLocation = location;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 119, 13, 13),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.feed.title?.toString() ?? '',
            style: kTitleStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Verdana',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                  _showFavoritesOnly ? Icons.favorite : Icons.favorite_border),
              onPressed: toggleShowFavoritesOnly,
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color.fromARGB(255, 241, 241, 241),
                Color.fromARGB(255, 216, 216, 216),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 0, right: 15, bottom: 0, left: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 119, 13, 13),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Your Job',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            suffixIcon: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            suffixIconConstraints: BoxConstraints()),
                        onChanged: (value) {
                          setState(
                            () {
                              searchQuery = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _showLocationBottomSheet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedLocation.isEmpty
                                ? 'All Locations'
                                : selectedLocation.capitalize(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 12,
                    bottom: 15,
                    left: 12,
                  ),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = filteredItems[index];
                        String title = item.title?.toString() ?? '';
                        String description = item.description?.toString() ?? '';
                        //title = title.replaceAll(RegExp(r'[0-9]'), '');
                        //title = title.replaceAll('-', '⦁');
                        title = title.trim().replaceAll(RegExp(r'\s+'), ' ');
                        description =
                            description.trim().replaceAll(RegExp(r'\s+'), ' ');
                        final Uri toLaunch = Uri(
                          scheme: 'http',
                          host: '123.231.114.194',
                          port: 7070,
                          path: 'employer/JobAdvertismentServlet',
                          queryParameters: {
                            'ac': item.author,
                            'jc': item.comments,
                            'ec': item.guid,
                          },
                        );
                        return InkWell(
                          onTap: () => {_launched = _launchInBrowser(toLaunch)},
                          child: Card(
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                right: 10.0,
                                bottom: 16.0,
                                left: 16.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          'http://123.231.114.194:7070/logo/${item.dc?.publisher}',
                                          width: 50,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                              size: 24.0,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            title,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            description,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            item.dc?.creator ?? '',
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            '${item.dc?.coverage}',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 13, 101, 173),
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'Expires on: ${item.dc?.rights}',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 165, 17, 17),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            _isItemFavorite(item)
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: _isItemFavorite(item)
                                                ? Colors.red
                                                : const Color.fromARGB(
                                                    255, 134, 134, 134),
                                          ),
                                          onPressed: () =>
                                              _toggleFavoriteItem(item),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
