import 'package:flutter/material.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';

class PopularCard extends StatelessWidget {
  final Hotjobs hotjobs;
  const PopularCard({super.key, required this.hotjobs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: const EdgeInsets.only(right: 18.0),
      padding: const EdgeInsets.only(top: 15, right: 15, bottom: 5, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    width: 100,
                    height: 40,
                    color: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(hotjobs.imageUrl)),
              ),
              const Spacer(),
              Text(
                hotjobs.jdposition,
                style: kTitleStyle,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            hotjobs.description,
            style: kTitleStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5.0),
          Text(
            '${hotjobs.title} ⦁ ${hotjobs.jblocation}',
            style: kTitleStyle.copyWith(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: hotjobs.tag
                    .map((e) => Container(
                          alignment: Alignment.center,
                          height: 25,
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.only(
                              top: 0, right: 10, bottom: 0, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: kBlack,
                          ),
                          child: Text(e,
                              style: kTitleStyle.copyWith(
                                color: Colors.white,
                                fontSize: 10.0,
                              )),
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
