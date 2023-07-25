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
      backgroundColor: Colors.black,
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
                        fontSize: 58,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
                  // SizedBox(
                  //   width: 160.0,
                  //   height: 50.0,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         PageTransition(
                  //           type: PageTransitionType.fade,
                  //           duration: const Duration(milliseconds: 200),
                  //           child: const LoginPage(),
                  //         ),
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       foregroundColor: Colors.white,
                  //       backgroundColor: const Color.fromARGB(255, 52, 177, 14),
                  //     ),
                  //     child: const Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Text('Sign In'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   child: Text(
                  //     'OR',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  SizedBox(
                    width: 160.0,
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
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 21, 177, 15),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('View Latest Jobs'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70.0,
              child: Center(
                child: Text(
                  'Design & Developed By Heshan @ GENESIIS',
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5,
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
