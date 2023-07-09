import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:topjobs/views/home.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _hideSplash();
  }

  Future<void> _hideSplash() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'topjobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _showSplash ? const SplashScreen() : const MyHomePage(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    letterSpacing: .5,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 60,
                ),
                child: Text(
                  'tj',
                  style: TextStyle(
                    fontFamily: 'Verdana',
                    fontSize: 78,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const ScaleAnimatedWidget(
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
              const SizedBox(
                height: 10,
              ),
              const ScaleAnimatedWidget(
                child: Text(
                  'Recruitment Made Easy',
                  style: TextStyle(
                      fontFamily: 'Verdana',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
