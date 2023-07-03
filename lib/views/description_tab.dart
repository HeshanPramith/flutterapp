import 'package:flutter/material.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key, required this.hotjobs});

  final Hotjobs hotjobs;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 15.0,
          ),
          Text('Company Details',
              style: kTitleStyle.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            hotjobs.aboutcompany,
            style: kSubtitleStyle.copyWith(height: 2),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Company : ${hotjobs.title}',
            style: kSubtitleStyle.copyWith(height: 2),
          ),
          Text(
            'Location : ${hotjobs.jblocation}',
            style: kSubtitleStyle.copyWith(height: 2),
          ),
        ],
      ),
    );
  }
}
