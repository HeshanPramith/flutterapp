import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/models/feeditems.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/io_client.dart';
import 'dart:io';

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
    {'title': 'IT-SW/DB/QA/Web/Graphics/GIS', 'icon': Icons.design_services},
    {'title': 'IT-HW/Networks/Systems', 'icon': Icons.network_wifi},
    {'title': 'Accounting/Auditing/Finance', 'icon': Icons.account_balance},
    {'title': 'Banking/Insurance', 'icon': Icons.money},
    {'title': 'Sales/Marketing/Merchandising', 'icon': Icons.shopify},
    {'title': 'HR/Training', 'icon': Icons.people},
    {'title': 'Corporate Management/Analysts', 'icon': Icons.pie_chart},
    {
      'title': 'Admin/Secretary/Receptionist',
      'icon': Icons.admin_panel_settings
    },
    {'title': 'Civil Eng/Interior/Architecture', 'icon': Icons.house_siding},
    {'title': 'IT-Telecoms', 'icon': Icons.phone},
    {'title': 'Customer/Public Relations', 'icon': Icons.verified_user},
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
