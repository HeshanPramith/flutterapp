import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'package:topjobs/models/feedlist.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/io_client.dart';
import 'dart:io';

class WelcomePage extends StatefulWidget {
  final List<int> rssCounts;
  const WelcomePage({Key? key, required this.rssCounts}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // List<String> rssUrls = [
  //   'http://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
  //   'http://www.topjobs.lk/rss/it_hware_networks_systems.rss',
  //   'http://www.topjobs.lk/rss/accounting_auditing_finance.rss',
  //   'http://www.topjobs.lk/rss/banking_insurance.rss',
  //   'http://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
  //   'http://www.topjobs.lk/rss/hr_training.rss',
  //   'http://www.topjobs.lk/rss/corporate_management_analysts.rss',
  //   'http://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
  //   'http://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
  //   'http://www.topjobs.lk/rss/it_telecoms.rss',
  //   'http://www.topjobs.lk/rss/customer_relations_public_relations.rss',
  //   'http://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
  //   'http://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
  //   'http://www.topjobs.lk/rss/manufacturing_operations.rss',
  //   'http://www.topjobs.lk/rss/media_advert_communication.rss',
  //   'http://www.topjobs.lk/rss/hotels_restaurants_food.rss',
  //   'http://www.topjobs.lk/rss/hospitality_tourism.rss',
  //   'http://www.topjobs.lk/rss/sports_fitness_recreation.rss',
  //   'http://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
  //   'http://www.topjobs.lk/rss/legal_law.rss',
  //   'http://www.topjobs.lk/rss/supervision_quality_control.rss',
  //   'http://www.topjobs.lk/rss/apparel_clothing.rss',
  //   'http://www.topjobs.lk/rss/ticketing_airline_marine.rss',
  //   'http://www.topjobs.lk/rss/teaching_academic_library.rss',
  //   'http://www.topjobs.lk/rss/rnd_science_research.rss',
  //   'http://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
  //   'http://www.topjobs.lk/rss/security.rss',
  //   'http://www.topjobs.lk/rss/fashion_design_beauty.rss',
  //   'http://www.topjobs.lk/rss/international_development.rss',
  //   'http://www.topjobs.lk/rss/kpo_bpo.rss',
  //   'http://www.topjobs.lk/rss/imports_exports.rss'
  // ];

  // List<int> rssCounts = [];

  @override
  void initState() {
    super.initState();
    // rssUrls = [
    //   'http://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss',
    //   'http://www.topjobs.lk/rss/it_hware_networks_systems.rss',
    //   'http://www.topjobs.lk/rss/accounting_auditing_finance.rss',
    //   'http://www.topjobs.lk/rss/banking_insurance.rss',
    //   'http://www.topjobs.lk/rss/sales_marketing_merchandising.rss',
    //   'http://www.topjobs.lk/rss/hr_training.rss',
    //   'http://www.topjobs.lk/rss/corporate_management_analysts.rss',
    //   'http://www.topjobs.lk/rss/office_admin_secretary_receptionist.rss',
    //   'http://www.topjobs.lk/rss/civil_eng_interior_design_architecture.rss',
    //   'http://www.topjobs.lk/rss/it_telecoms.rss',
    //   'http://www.topjobs.lk/rss/customer_relations_public_relations.rss',
    //   'http://www.topjobs.lk/rss/logistics_warehouse_transport.rss',
    //   'http://www.topjobs.lk/rss/eng_mech_auto_elec.rss',
    //   'http://www.topjobs.lk/rss/manufacturing_operations.rss',
    //   'http://www.topjobs.lk/rss/media_advert_communication.rss',
    //   'http://www.topjobs.lk/rss/hotels_restaurants_food.rss',
    //   'http://www.topjobs.lk/rss/hospitality_tourism.rss',
    //   'http://www.topjobs.lk/rss/sports_fitness_recreation.rss',
    //   'http://www.topjobs.lk/rss/hospital_nursing_healthcare.rss',
    //   'http://www.topjobs.lk/rss/legal_law.rss',
    //   'http://www.topjobs.lk/rss/supervision_quality_control.rss',
    //   'http://www.topjobs.lk/rss/apparel_clothing.rss',
    //   'http://www.topjobs.lk/rss/ticketing_airline_marine.rss',
    //   'http://www.topjobs.lk/rss/teaching_academic_library.rss',
    //   'http://www.topjobs.lk/rss/rnd_science_research.rss',
    //   'http://www.topjobs.lk/rss/agriculture_dairy_environment.rss',
    //   'http://www.topjobs.lk/rss/security.rss',
    //   'http://www.topjobs.lk/rss/fashion_design_beauty.rss',
    //   'http://www.topjobs.lk/rss/international_development.rss',
    //   'http://www.topjobs.lk/rss/kpo_bpo.rss',
    //   'http://www.topjobs.lk/rss/imports_exports.rss'
    // ];
    // rssCounts = List<int>.filled(rssUrls.length, 0);
    // fetchRSSCounts();
    Future.delayed(Duration(seconds: 3), () {
      navigateToRSSFeedScreen();
    });
  }

  // void fetchRSSCounts() async {
  //   for (int i = 0; i < rssUrls.length; i++) {
  //     var httpClient = HttpClient()
  //       ..badCertificateCallback =
  //           ((X509Certificate cert, String host, int port) => true);
  //     var ioClient = IOClient(httpClient);

  //     var response = await ioClient.get(Uri.parse(rssUrls[i]));

  //     if (response.statusCode == 200) {
  //       var rssFeed = RssFeed.parse(response.body);
  //       setState(() {
  //         rssCounts[i] = rssFeed.items?.length ?? 0;
  //       });
  //     }

  //     ioClient.close();
  //   }

  //   if (mounted) {
  //     navigateToRSSFeedScreen();
  //   }
  // }

  int calculateTotalCount(List<int> counts) {
    int sum = 0;
    for (int count in counts) {
      sum += count;
    }
    return sum;
  }

  // void navigateToRSSFeedScreen() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const RSSFeedScreen(
  //         rssCounts: [],
  //       ),
  //     ),
  //   );
  // }

  void navigateToRSSFeedScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RSSFeedScreen(
          rssCounts: widget.rssCounts,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    //int totalCount = calculateTotalCount(rssCounts);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 247, 66, 66),
              Color.fromARGB(255, 100, 1, 1),
            ],
          ),
        ),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleAnimatedWidget(
                duration: Duration(milliseconds: 800),
                child: Text(
                  'topjobs',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ScaleAnimatedWidget(
                duration: Duration(milliseconds: 800),
                child: Text(
                  'Recruitment Made Easy',
                  style: TextStyle(
                      fontFamily: 'Verdana',
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  // 'Total Vacancies: $totalCount',
                  'More than 3500+ jobs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
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
