import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/main_page.dart';

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

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    controller.repeat();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const Mainpage(title: "Heshan"),
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
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome To Test App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RotationTransition(
              turns: animation,
              child: const Icon(
                Icons.webhook,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Flutter By Heshan',
              style: TextStyle(
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
