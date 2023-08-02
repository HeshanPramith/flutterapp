import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/constants.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RSSFeedScreen extends StatefulWidget {
  final List<int> rssCounts;
  const RSSFeedScreen({Key? key, required this.rssCounts}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RSSFeedScreenState();
}

class _RSSFeedScreenState extends State<RSSFeedScreen> {
  List<String> rssUrls = [
    'http://123.231.114.194:7070/rss/it_sware_db_qa_web_graphics_gis.rss',
    'http://123.231.114.194:7070/rss/it_hware_networks_systems.rss',
    'http://123.231.114.194:7070/rss/accounting_auditing_finance.rss',
    'http://123.231.114.194:7070/rss/banking_insurance.rss',
    'http://123.231.114.194:7070/rss/sales_marketing_merchandising.rss',
    'http://123.231.114.194:7070/rss/hr_training.rss',
    'http://123.231.114.194:7070/rss/corporate_management_analysts.rss',
    'http://123.231.114.194:7070/rss/office_admin_secretary_receptionist.rss',
    'http://123.231.114.194:7070/rss/civil_eng_interior_design_architecture.rss',
    'http://123.231.114.194:7070/rss/it_telecoms.rss',
    'http://123.231.114.194:7070/rss/customer_relations_public_relations.rss',
    'http://123.231.114.194:7070/rss/logistics_warehouse_transport.rss',
    'http://123.231.114.194:7070/rss/eng_mech_auto_elec.rss',
    'http://123.231.114.194:7070/rss/manufacturing_operations.rss',
    'http://123.231.114.194:7070/rss/media_advert_communication.rss',
    'http://123.231.114.194:7070/rss/hotels_restaurants_food.rss',
    'http://123.231.114.194:7070/rss/hospitality_tourism.rss',
    'http://123.231.114.194:7070/rss/sports_fitness_recreation.rss',
    'http://123.231.114.194:7070/rss/hospital_nursing_healthcare.rss',
    'http://123.231.114.194:7070/rss/legal_law.rss',
    'http://123.231.114.194:7070/rss/supervision_quality_control.rss',
    'http://123.231.114.194:7070/rss/apparel_clothing.rss',
    'http://123.231.114.194:7070/rss/ticketing_airline_marine.rss',
    'http://123.231.114.194:7070/rss/teaching_academic_library.rss',
    'http://123.231.114.194:7070/rss/rnd_science_research.rss',
    'http://123.231.114.194:7070/rss/agriculture_dairy_environment.rss',
    'http://123.231.114.194:7070/rss/security.rss',
    'http://123.231.114.194:7070/rss/fashion_design_beauty.rss',
    'http://123.231.114.194:7070/rss/international_development.rss',
    'http://123.231.114.194:7070/rss/kpo_bpo.rss',
    'http://123.231.114.194:7070/rss/imports_exports.rss'
  ];

  List<Map<String, dynamic>> rssTitles = [
    {'title': 'IT-Sware/DB/QA/Web/Graphics/GIS', 'icon': Icons.design_services},
    {'title': 'IT-HWare/Networks/Systems', 'icon': Icons.network_wifi},
    {'title': 'Accounting/Auditing/Finance', 'icon': Icons.account_balance},
    {'title': 'Banking/Insurance', 'icon': Icons.money},
    {'title': 'Sales/Marketing/Merchandising', 'icon': Icons.shopify},
    {'title': 'HR/Training', 'icon': Icons.people},
    {'title': 'Corporate Management/Analysts', 'icon': Icons.pie_chart},
    {
      'title': 'Office Admin/Secretary/Receptionist',
      'icon': Icons.admin_panel_settings
    },
    {
      'title': 'Civil Eng/Interior Design/Architecture',
      'icon': Icons.house_siding
    },
    {'title': 'IT-Telecoms', 'icon': Icons.phone},
    {
      'title': 'Customer Relations/Public Relations',
      'icon': Icons.verified_user
    },
    {'title': 'Logistics/Warehouse/Transport', 'icon': Icons.car_rental},
    {'title': 'Eng-Mech/Auto/Elec', 'icon': Icons.tv},
    {'title': 'Manufacturing/Operations', 'icon': Icons.gif_box},
    {'title': 'Media/Advert/Communication', 'icon': Icons.video_camera_back},
    {'title': 'Hotels/Restaurants/Food', 'icon': Icons.hotel},
    {'title': 'Hospitality/Tourism', 'icon': Icons.directions_boat},
    {'title': 'Sports/Fitness/Recreation', 'icon': Icons.sports_gymnastics},
    {'title': 'Hospital/Nursing/Healthcare', 'icon': Icons.local_hospital},
    {'title': 'Legal/Law', 'icon': Icons.local_library},
    {'title': 'Supervision/Quality Control', 'icon': Icons.check_circle},
    {'title': 'Apparel/Clothing', 'icon': Icons.checkroom},
    {'title': 'Ticketing/Airline/Marine', 'icon': Icons.airplane_ticket},
    {'title': 'Teaching/Academic/Library', 'icon': Icons.library_add},
    {'title': 'R&D/Science/Research', 'icon': Icons.hourglass_bottom},
    {'title': 'Agriculture/Dairy/Environment', 'icon': Icons.computer},
    {'title': 'Security', 'icon': Icons.security},
    {'title': 'Fashion/Design/Beauty', 'icon': Icons.spa},
    {'title': 'International Development', 'icon': Icons.sports_volleyball},
    {'title': 'KPO/BPO', 'icon': Icons.stream},
    {'title': 'Imports/Exports', 'icon': Icons.import_export},
  ];

  List<int> rssCounts = [];

  @override
  void initState() {
    super.initState();
    rssUrls = [
      'http://123.231.114.194:7070/rss/it_sware_db_qa_web_graphics_gis.rss',
      'http://123.231.114.194:7070/rss/it_hware_networks_systems.rss',
      'http://123.231.114.194:7070/rss/accounting_auditing_finance.rss',
      'http://123.231.114.194:7070/rss/banking_insurance.rss',
      'http://123.231.114.194:7070/rss/sales_marketing_merchandising.rss',
      'http://123.231.114.194:7070/rss/hr_training.rss',
      'http://123.231.114.194:7070/rss/corporate_management_analysts.rss',
      'http://123.231.114.194:7070/rss/office_admin_secretary_receptionist.rss',
      'http://123.231.114.194:7070/rss/civil_eng_interior_design_architecture.rss',
      'http://123.231.114.194:7070/rss/it_telecoms.rss',
      'http://123.231.114.194:7070/rss/customer_relations_public_relations.rss',
      'http://123.231.114.194:7070/rss/logistics_warehouse_transport.rss',
      'http://123.231.114.194:7070/rss/eng_mech_auto_elec.rss',
      'http://123.231.114.194:7070/rss/manufacturing_operations.rss',
      'http://123.231.114.194:7070/rss/media_advert_communication.rss',
      'http://123.231.114.194:7070/rss/hotels_restaurants_food.rss',
      'http://123.231.114.194:7070/rss/hospitality_tourism.rss',
      'http://123.231.114.194:7070/rss/sports_fitness_recreation.rss',
      'http://123.231.114.194:7070/rss/hospital_nursing_healthcare.rss',
      'http://123.231.114.194:7070/rss/legal_law.rss',
      'http://123.231.114.194:7070/rss/supervision_quality_control.rss',
      'http://123.231.114.194:7070/rss/apparel_clothing.rss',
      'http://123.231.114.194:7070/rss/ticketing_airline_marine.rss',
      'http://123.231.114.194:7070/rss/teaching_academic_library.rss',
      'http://123.231.114.194:7070/rss/rnd_science_research.rss',
      'http://123.231.114.194:7070/rss/agriculture_dairy_environment.rss',
      'http://123.231.114.194:7070/rss/security.rss',
      'http://123.231.114.194:7070/rss/fashion_design_beauty.rss',
      'http://123.231.114.194:7070/rss/international_development.rss',
      'http://123.231.114.194:7070/rss/kpo_bpo.rss',
      'http://123.231.114.194:7070/rss/imports_exports.rss'
    ];
    rssCounts = List<int>.filled(rssUrls.length, 0);
    fetchRSSCounts();
  }

  void fetchRSSCounts() async {
    for (int i = 0; i < rssUrls.length; i++) {
      var httpClient = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      var ioClient = IOClient(httpClient);

      var response = await ioClient.get(Uri.parse(rssUrls[i]));

      if (response.statusCode == 200) {
        var rssFeed = RssFeed.parse(response.body);
        setState(() {
          rssCounts[i] = rssFeed.items?.length ?? 0;
        });
      }

      ioClient.close();
    }
  }

  void loadRSSFeed(String url) async {
    var httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    var ioClient = IOClient(httpClient);

    var response = await ioClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var rssFeed = RssFeed.parse(response.body);
      int index = rssUrls.indexOf(url);
      setState(
        () {
          rssCounts[index] = rssFeed.items?.length ?? 0;
        },
      );
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          child: RSSFeedItemsScreen(feed: rssFeed),
        ),
      );
    } else {}

    ioClient.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: const Text(
          'Choose Your Career Path',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Verdana',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, right: 12, bottom: 15, left: 12),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: rssUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            elevation: 0.0,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Icon(
                                    rssTitles[index]['icon'],
                                    size: 22,
                                    color:
                                        const Color.fromARGB(255, 49, 49, 49),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              '${rssTitles[index]['title']} ⦁ ',
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '(${rssCounts[index]})',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            loadRSSFeed(rssUrls[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    locations.sort(); // Optional: Sort the locations alphabetically.
    return locations;
  }

  void _showLocationBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 30.0,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    'All Locations',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLocation = '';
                    });
                    Navigator.pop(
                        context); // Close the BottomSheet after selection
                  },
                ),
                for (String location in getUniqueLocations())
                  ListTile(
                    title: Text(
                      location,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        selectedLocation = location;
                      });
                      Navigator.pop(
                          context); // Close the BottomSheet after selection
                    },
                  ),
              ],
            ),
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
                              color: Color.fromARGB(111, 255, 255, 255),
                            ),
                            suffixIcon: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 18,
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
                      ),
                      child: Text(
                        selectedLocation.isEmpty
                            ? 'All Locations'
                            : selectedLocation,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
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
                        //title = title.replaceAll(RegExp(r'[0-9]'), '');
                        //title = title.replaceAll('-', '⦁');
                        title = title.trim().replaceAll(RegExp(r'\s+'), ' ');
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
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 15,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    minLeadingWidth: 20,
                                    contentPadding: const EdgeInsets.all(0),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          item.description?.toString() ?? '',
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
                                            fontSize: 14.0,
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
                                          ),
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
