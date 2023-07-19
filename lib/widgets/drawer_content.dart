import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/views/home.dart';
import 'package:topjobs/views/myaccount.dart';

class TjDrawerContent extends StatefulWidget {
  const TjDrawerContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TjDrawerContentState createState() => _TjDrawerContentState();
}

class _TjDrawerContentState extends State<TjDrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.house,
                    size: 18.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Myaccount(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.userShield,
                    size: 15.0,
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.gear,
                    size: 18.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
