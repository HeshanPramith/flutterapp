import 'package:flutter/material.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';

class PopularCard2 extends StatelessWidget {
  final Hotjobs hotjobs;
  const PopularCard2({super.key, required this.hotjobs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: const EdgeInsets.only(right: 18.0),
      padding: const EdgeInsets.only(top: 15, right: 15, bottom: 5, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromARGB(255, 184, 12, 12),
            Color.fromARGB(255, 58, 14, 14),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
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
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(hotjobs.imageUrl)),
              ),
              const Spacer(),
              Text(
                hotjobs.jdposition,
                style: kTitleStyle.copyWith(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            hotjobs.description,
            style: kTitleStyle.copyWith(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 5.0),
          Text(
            '${hotjobs.title} ⦁ ${hotjobs.jblocation}',
            style: kTitleStyle.copyWith(
              color: Colors.white,
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
                            color: Colors.white,
                          ),
                          child: Text(e,
                              style: kTitleStyle.copyWith(
                                color: Colors.black,
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
