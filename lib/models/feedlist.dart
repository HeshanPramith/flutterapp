import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/models/feeditems.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class RSSFeedScreen extends StatefulWidget {
  final List<int> rssCounts;
  const RSSFeedScreen({Key? key, required this.rssCounts}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RSSFeedScreenState();
}

class _RSSFeedScreenState extends State<RSSFeedScreen> {
  late SharedPreferences _prefs;

  List<String> rssUrls = [
    'https://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
    'https://www.topjobs.lk/rss/it_hware_networks_systems.rss',
    'https://www.topjobs.lk/rss/accounting_auditing_finance.rss',
    'https://www.topjobs.lk/rss/banking_insurance.rss',
    'https://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
    'https://www.topjobs.lk/rss/hr_training.rss',
    'https://www.topjobs.lk/rss/corporate_management_analysts.rss',
    'https://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
    'https://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
    'https://www.topjobs.lk/rss/it_telecoms.rss',
    'https://www.topjobs.lk/rss/customer_relations_public_relations.rss',
    'https://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
    'https://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
    'https://www.topjobs.lk/rss/manufacturing_operations.rss',
    'https://www.topjobs.lk/rss/media_advert_communication.rss',
    'https://www.topjobs.lk/rss/hotels_restaurants_food.rss',
    'https://www.topjobs.lk/rss/hospitality_tourism.rss',
    'https://www.topjobs.lk/rss/sports_fitness_recreation.rss',
    'https://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
    'https://www.topjobs.lk/rss/legal_law.rss',
    'https://www.topjobs.lk/rss/supervision_quality_control.rss',
    'https://www.topjobs.lk/rss/apparel_clothing.rss',
    'https://www.topjobs.lk/rss/ticketing_airline_marine.rss',
    'https://www.topjobs.lk/rss/teaching_academic_library.rss',
    'https://www.topjobs.lk/rss/rnd_science_research.rss',
    'https://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
    'https://www.topjobs.lk/rss/security.rss',
    'https://www.topjobs.lk/rss/fashion_design_beauty.rss',
    'https://www.topjobs.lk/rss/international_development.rss',
    'https://www.topjobs.lk/rss/kpo_bpo.rss',
    'https://www.topjobs.lk/rss/imports_exports.rss'
  ];

  List<Map<String, dynamic>> rssTitles = [
    {
      'title': 'IT-SW/DB/QA/Web/Graphics/GIS',
      'icon': Icons.design_services,
      'bookmarked': false
    },
    {
      'title': 'IT-HW/Networks/Systems',
      'icon': Icons.network_wifi,
      'bookmarked': false
    },
    {
      'title': 'Accounting/Auditing/Finance',
      'icon': Icons.account_balance,
      'bookmarked': false
    },
    {'title': 'Banking/Insurance', 'icon': Icons.money, 'bookmarked': false},
    {
      'title': 'Sales/Marketing/Merchandising',
      'icon': Icons.shopify,
      'bookmarked': false
    },
    {'title': 'HR/Training', 'icon': Icons.people, 'bookmarked': false},
    {
      'title': 'Corporate Management/Analysts',
      'icon': Icons.pie_chart,
      'bookmarked': false
    },
    {
      'title': 'Admin/Secretary/Receptionist',
      'icon': Icons.admin_panel_settings,
      'bookmarked': false
    },
    {
      'title': 'Civil Eng/Interior/Architecture',
      'icon': Icons.house_siding,
      'bookmarked': false
    },
    {'title': 'IT-Telecoms', 'icon': Icons.phone, 'bookmarked': false},
    {
      'title': 'Customer/Public Relations',
      'icon': Icons.verified_user,
      'bookmarked': false
    },
    {
      'title': 'Logistics/Warehouse/Transport',
      'icon': Icons.car_rental,
      'bookmarked': false
    },
    {'title': 'Eng-Mech/Auto/Elec', 'icon': Icons.tv, 'bookmarked': false},
    {
      'title': 'Manufacturing/Operations',
      'icon': Icons.gif_box,
      'bookmarked': false
    },
    {
      'title': 'Media/Advert/Communication',
      'icon': Icons.video_camera_back,
      'bookmarked': false
    },
    {
      'title': 'Hotels/Restaurants/Food',
      'icon': Icons.hotel,
      'bookmarked': false
    },
    {
      'title': 'Hospitality/Tourism',
      'icon': Icons.directions_boat,
      'bookmarked': false
    },
    {
      'title': 'Sports/Fitness/Recreation',
      'icon': Icons.sports_gymnastics,
      'bookmarked': false
    },
    {
      'title': 'Hospital/Nursing/Healthcare',
      'icon': Icons.local_hospital,
      'bookmarked': false
    },
    {'title': 'Legal/Law', 'icon': Icons.local_library, 'bookmarked': false},
    {
      'title': 'Supervision/Quality Control',
      'icon': Icons.check_circle,
      'bookmarked': false
    },
    {'title': 'Apparel/Clothing', 'icon': Icons.checkroom, 'bookmarked': false},
    {
      'title': 'Ticketing/Airline/Marine',
      'icon': Icons.airplane_ticket,
      'bookmarked': false
    },
    {
      'title': 'Teaching/Academic/Library',
      'icon': Icons.library_add,
      'bookmarked': false
    },
    {
      'title': 'R&D/Science/Research',
      'icon': Icons.hourglass_bottom,
      'bookmarked': false
    },
    {
      'title': 'Agriculture/Dairy/Environment',
      'icon': Icons.computer,
      'bookmarked': false
    },
    {'title': 'Security', 'icon': Icons.security, 'bookmarked': false},
    {'title': 'Fashion/Design/Beauty', 'icon': Icons.spa, 'bookmarked': false},
    {
      'title': 'International Development',
      'icon': Icons.sports_volleyball,
      'bookmarked': false
    },
    {'title': 'KPO/BPO', 'icon': Icons.stream, 'bookmarked': false},
    {
      'title': 'Imports/Exports',
      'icon': Icons.import_export,
      'bookmarked': false
    },
  ];

  List<int> rssCounts = [];

  @override
  void initState() {
    super.initState();
    rssUrls = [
      'https://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
      'https://www.topjobs.lk/rss/it_hware_networks_systems.rss',
      'https://www.topjobs.lk/rss/accounting_auditing_finance.rss',
      'https://www.topjobs.lk/rss/banking_insurance.rss',
      'https://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
      'https://www.topjobs.lk/rss/hr_training.rss',
      'https://www.topjobs.lk/rss/corporate_management_analysts.rss',
      'https://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
      'https://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
      'https://www.topjobs.lk/rss/it_telecoms.rss',
      'https://www.topjobs.lk/rss/customer_relations_public_relations.rss',
      'https://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
      'https://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
      'https://www.topjobs.lk/rss/manufacturing_operations.rss',
      'https://www.topjobs.lk/rss/media_advert_communication.rss',
      'https://www.topjobs.lk/rss/hotels_restaurants_food.rss',
      'https://www.topjobs.lk/rss/hospitality_tourism.rss',
      'https://www.topjobs.lk/rss/sports_fitness_recreation.rss',
      'https://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
      'https://www.topjobs.lk/rss/legal_law.rss',
      'https://www.topjobs.lk/rss/supervision_quality_control.rss',
      'https://www.topjobs.lk/rss/apparel_clothing.rss',
      'https://www.topjobs.lk/rss/ticketing_airline_marine.rss',
      'https://www.topjobs.lk/rss/teaching_academic_library.rss',
      'https://www.topjobs.lk/rss/rnd_science_research.rss',
      'https://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
      'https://www.topjobs.lk/rss/security.rss',
      'https://www.topjobs.lk/rss/fashion_design_beauty.rss',
      'https://www.topjobs.lk/rss/international_development.rss',
      'https://www.topjobs.lk/rss/kpo_bpo.rss',
      'https://www.topjobs.lk/rss/imports_exports.rss'
    ];
    rssCounts = List<int>.filled(rssUrls.length, 0);
    initializeSharedPreferences();
    fetchRSSCounts();
  }

  void initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < rssTitles.length; i++) {
      bool isBookmarked = _prefs.getBool('bookmark_$i') ?? false;
      setState(() {
        rssTitles[i]['bookmarked'] = isBookmarked;
      });
    }
  }

  void _toggleBookmark(int index) {
    setState(() {
      bool newValue = !rssTitles[index]['bookmarked'];
      rssTitles[index]['bookmarked'] = newValue;
      _prefs.setBool('bookmark_$index', newValue);
    });
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

  void navigateToBookmarkedItems(String title) async {
    String rssUrl =
        rssUrls[rssTitles.indexWhere((item) => item['title'] == title)];

    var httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    var ioClient = IOClient(httpClient);

    var response = await ioClient.get(Uri.parse(rssUrl));

    if (response.statusCode == 200) {
      var rssFeed = RssFeed.parse(response.body);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          child: RSSFeedItemsScreen(feed: rssFeed),
        ),
      );
    }

    ioClient.close();
  }

  List<Map<String, dynamic>> getBookmarkedItems() {
    return rssTitles.where((item) => item['bookmarked'] == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
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
            if (getBookmarkedItems().isNotEmpty)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 194, 25, 25),
                      Color.fromARGB(255, 156, 19, 19),
                      Color.fromARGB(255, 119, 13, 13),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: const Text(
                        'My Favorite Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: getBookmarkedItems().length,
                            itemBuilder: (context, index) {
                              final title =
                                  getBookmarkedItems()[index]['title'];
                              return InkWell(
                                onTap: () {
                                  navigateToBookmarkedItems(title);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Icon(
                                              getBookmarkedItems()[index]
                                                  ['icon'],
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Center(
                                            child: Text(
                                              title.length > 10
                                                  ? title.substring(0, 10) +
                                                      '...'
                                                  : title,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                        final isBookmarked = rssTitles[index]['bookmarked'];
                        return InkWell(
                          child: Card(
                            elevation: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    child: IconButton(
                                      icon: Icon(
                                        isBookmarked
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        color: isBookmarked
                                            ? const Color.fromARGB(
                                                255, 16, 219, 50)
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        _toggleBookmark(index);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text:
                                                '${rssTitles[index]['title']} ',
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                            ),
                                            children: <TextSpan>[
                                              if (rssCounts[index] > 0)
                                                TextSpan(
                                                  text:
                                                      ' ⦁  (${rssCounts[index]})',
                                                  style: TextStyle(
                                                    color: isBookmarked
                                                        ? const Color.fromARGB(
                                                            255, 16, 219, 50)
                                                        : const Color.fromARGB(
                                                            255, 75, 75, 75),
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
