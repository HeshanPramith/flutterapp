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

    if (mounted) {
      navigateToRSSFeedScreen();
    }
  }

  int calculateTotalCount(List<int> counts) {
    int sum = 0;
    for (int count in counts) {
      sum += count;
    }
    return sum;
  }

  void navigateToRSSFeedScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RSSFeedScreen(
          rssCounts: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    int totalCount = calculateTotalCount(rssCounts);
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ScaleAnimatedWidget(
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
              const SizedBox(
                height: 10,
              ),
              const ScaleAnimatedWidget(
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
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Total Occupations: $totalCount',
                  style: const TextStyle(
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
