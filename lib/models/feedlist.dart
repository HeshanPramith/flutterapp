import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/constants.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:topjobs/views/home.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/io_client.dart';
import 'dart:io';

class RSSFeedScreen extends StatefulWidget {
  const RSSFeedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RSSFeedScreenState();
}

class _RSSFeedScreenState extends State<RSSFeedScreen> {
  List<String> rssUrls = [
    'http://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
    'http://www.topjobs.lk/rss/it_hware_networks_systems.rss',
    'http://www.topjobs.lk/rss/accounting_auditing_finance.rss',
    'http://www.topjobs.lk/rss/banking_insurance.rss',
    'http://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
    'http://www.topjobs.lk/rss/hr_training.rss',
    'http://www.topjobs.lk/rss/corporate_management_analysts.rss',
    'http://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
    'http://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
    'http://www.topjobs.lk/rss/it_telecoms.rss',
    'http://www.topjobs.lk/rss/customer_relations_public_relations.rss',
    'http://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
    'http://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
    'http://www.topjobs.lk/rss/manufacturing_operations.rss',
    'http://www.topjobs.lk/rss/media_advert_communication.rss',
    'http://www.topjobs.lk/rss/hotels_restaurants_food.rss',
    'http://www.topjobs.lk/rss/hospitality_tourism.rss',
    'http://www.topjobs.lk/rss/sports_fitness_recreation.rss',
    'http://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
    'http://www.topjobs.lk/rss/legal_law.rss',
    'http://www.topjobs.lk/rss/supervision_quality_control.rss',
    'http://www.topjobs.lk/rss/apparel_clothing.rss',
    'http://www.topjobs.lk/rss/ticketing_airline_marine.rss',
    'http://www.topjobs.lk/rss/teaching_academic_library.rss',
    'http://www.topjobs.lk/rss/rnd_science_research.rss',
    'http://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
    'http://www.topjobs.lk/rss/security.rss',
    'http://www.topjobs.lk/rss/fashion_design_beauty.rss',
    'http://www.topjobs.lk/rss/international_development.rss',
    'http://www.topjobs.lk/rss/kpo_bpo.rss',
    'http://www.topjobs.lk/rss/imports_exports.rss'
  ];

  List<String> rssTitles = [
    'IT-Sware/DB/QA/Web/Graphics/GIS',
    'IT-HWare/Networks/Systems',
    'Accounting/Auditing/Finance',
    'Banking/Insurance',
    'Sales/Marketing/Merchandising',
    'HR/Training',
    'Corporate Management/Analysts',
    'Office Admin/Secretary/Receptionist',
    'Civil Eng/Interior Design/Architecture',
    'IT-Telecoms',
    'Customer Relations/Public Relations',
    'Logistics/Warehouse/Transport',
    'Eng-Mech/Auto/Elec',
    'Manufacturing/Operations',
    'Media/Advert/Communication',
    'Hotels/Restaurants/Food',
    'Hospitality/Tourism',
    'Sports/Fitness/Recreation',
    'Hospital/Nursing/Healthcare',
    'Legal/Law',
    'Supervision/Quality Control',
    'Apparel/Clothing',
    'Ticketing/Airline/Marine',
    'Teaching/Academic/Library',
    'R&D/Science/Research',
    'Agriculture/Dairy/Environment',
    'Security',
    'Fashion/Design/Beauty',
    'International Development',
    'KPO/BPO',
    'Imports/Exports',
  ];

  List<int> rssCounts = [];

  @override
  void initState() {
    super.initState();
    rssUrls = [
      'http://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
      'http://www.topjobs.lk/rss/it_hware_networks_systems.rss',
      'http://www.topjobs.lk/rss/accounting_auditing_finance.rss',
      'http://www.topjobs.lk/rss/banking_insurance.rss',
      'http://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
      'http://www.topjobs.lk/rss/hr_training.rss',
      'http://www.topjobs.lk/rss/corporate_management_analysts.rss',
      'http://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
      'http://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
      'http://www.topjobs.lk/rss/it_telecoms.rss',
      'http://www.topjobs.lk/rss/customer_relations_public_relations.rss',
      'http://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
      'http://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
      'http://www.topjobs.lk/rss/manufacturing_operations.rss',
      'http://www.topjobs.lk/rss/media_advert_communication.rss',
      'http://www.topjobs.lk/rss/hotels_restaurants_food.rss',
      'http://www.topjobs.lk/rss/hospitality_tourism.rss',
      'http://www.topjobs.lk/rss/sports_fitness_recreation.rss',
      'http://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
      'http://www.topjobs.lk/rss/legal_law.rss',
      'http://www.topjobs.lk/rss/supervision_quality_control.rss',
      'http://www.topjobs.lk/rss/apparel_clothing.rss',
      'http://www.topjobs.lk/rss/ticketing_airline_marine.rss',
      'http://www.topjobs.lk/rss/teaching_academic_library.rss',
      'http://www.topjobs.lk/rss/rnd_science_research.rss',
      'http://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
      'http://www.topjobs.lk/rss/security.rss',
      'http://www.topjobs.lk/rss/fashion_design_beauty.rss',
      'http://www.topjobs.lk/rss/international_development.rss',
      'http://www.topjobs.lk/rss/kpo_bpo.rss',
      'http://www.topjobs.lk/rss/imports_exports.rss'
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Select Job Category',
          style: kTitleStyle.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Verdana',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
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
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category List',
                  style: kPageTitleStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const SizedBox(
                              //width: 50,
                              height: 50,
                              child: Icon(
                                FontAwesomeIcons.briefcase,
                                size: 18,
                                color: Color.fromARGB(255, 223, 171, 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rssTitles[index],
                                    style: kTitleStyle,
                                  ),
                                  Text(
                                    'Jobs: ${rssCounts[index]}',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 119, 13, 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
          ],
        ),
      ),
    );
  }
}

class RSSFeedItemsScreen extends StatelessWidget {
  final RssFeed feed;

  const RSSFeedItemsScreen({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          feed.title?.toString() ?? '',
          style: kTitleStyle.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Verdana',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 216, 216, 216),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        padding:
            const EdgeInsets.only(top: 20, right: 18, bottom: 18, left: 18),
        child: ListView.builder(
          itemCount: feed.items?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var item = feed.items?[index];
            return ListTile(
              title: Text(item?.title?.toString() ?? ''),
              subtitle: Text(item?.description?.toString() ?? ''),
            );
          },
        ),
      ),
    );
  }
}
