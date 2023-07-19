import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/welcomepage.dart';
import 'package:topjobs/widgets/drawer_content.dart';
import 'package:topjobs/widgets/drawer_header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 119, 13, 13),
          title: const Text('Dashboard'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 100),
                    child: const WelcomePage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(),
        drawer: Drawer(
          elevation: 0,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Column(
                children: [
                  TjDrawerHeader(),
                  TjDrawerContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
