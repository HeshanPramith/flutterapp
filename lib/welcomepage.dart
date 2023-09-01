import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'package:topjobs/models/feedlist.dart';

class WelcomePage extends StatefulWidget {
  final List<int> rssCounts;
  const WelcomePage({Key? key, required this.rssCounts}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      navigateToRSSFeedScreen();
    });
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
