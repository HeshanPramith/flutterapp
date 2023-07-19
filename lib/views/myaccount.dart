import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/welcomepage.dart';
import 'package:topjobs/widgets/drawer_content.dart';
import 'package:topjobs/widgets/drawer_header.dart';

class Myaccount extends StatefulWidget {
  const Myaccount({super.key});

  @override
  State<Myaccount> createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
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
          title: const Text('My Account'),
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
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 119, 13, 13),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 119, 13, 13),
                      Color.fromARGB(255, 233, 163, 34),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                        top: 20.0,
                      ),
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/user.jpg'),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            blurRadius: 40.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Heshan Pramith',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Row(),
              ),
            ],
          ),
        ),
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
