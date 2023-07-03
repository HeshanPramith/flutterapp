import 'package:flutter/material.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key, required this.hotjobs});

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
          Text('Job Overview',
              style: kTitleStyle.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            hotjobs.jobopportunity,
            style: kSubtitleStyle.copyWith(height: 2),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'Resposibilities',
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            children: hotjobs.jobResponsbilities
                .map((e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '⦁ ',
                          style: kPageTitleStyle,
                        ),
                        Expanded(
                            child: Text(
                          '$e\n',
                          style: kSubtitleStyle.copyWith(
                              fontWeight: FontWeight.w300, height: 2),
                        )),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
