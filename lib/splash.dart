import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topjobs/main_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const Mainpage(),
      ));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 168, 26, 26),
              Color.fromARGB(255, 92, 7, 7)
            ],
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'tj',
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.w800,
                fontFamily: 'VerdanaBold',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'topjobs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w600,
                fontFamily: 'verdana',
              ),
            ),
            Text(
              'Recruitement made easy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'verdana',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Flutter By Heshan Pramith',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
