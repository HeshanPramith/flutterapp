import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TjDrawerContent extends StatefulWidget {
  const TjDrawerContent({super.key});

  @override
  State<TjDrawerContent> createState() => _TjDrawerContentState();
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
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.box,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Dashboard',
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
                    FontAwesomeIcons.userShield,
                    size: 18.0,
                  ),
                  SizedBox(
                    width: 16.0,
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
