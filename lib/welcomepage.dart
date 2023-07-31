import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
// import 'package:topjobs/login.dart';
import 'package:topjobs/models/feedlist.dart';
// import 'package:topjobs/views/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Welcome To',
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .5,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 70.0),
              child: Column(
                children: [
                  ScaleAnimatedWidget(
                    duration: Duration(milliseconds: 800),
                    child: Text(
                      'topjobs',
                      style: TextStyle(
                        fontFamily: 'Verdana',
                        fontSize: 50,
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
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                right: 18.0,
                bottom: 40,
                left: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 200),
                            child: const RSSFeedScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 20, 218, 79),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 198, 42),
                        elevation: 0.0,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'View Latest Jobs',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
