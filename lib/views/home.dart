import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';
import 'package:topjobs/widgets/popular_card.dart';
import 'package:topjobs/widgets/popular_card2.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        leading: IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowRotateRight),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Text(
                'Hi Heshan, \nFind your Dream Job',
                style: kPageTitleStyle,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 0, right: 15, bottom: 0, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const TextField(
                          cursorColor: kBlack,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              icon: FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                size: 18,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.only(left: 15),
                      decoration: const BoxDecoration(
                          color: kBlack,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Icon(
                        FontAwesomeIcons.sliders,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                'Popular Jobs',
                style: kTitleStyle,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 170.0,
                child: ListView.builder(
                    itemCount: hotjobList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // ignore: non_constant_identifier_names
                      var Hotjobs = hotjobList[index];
                      return InkWell(
                          onTap: () {},
                          child: index == 0
                              ? PopularCard(hotjobs: Hotjobs)
                              : PopularCard2(hotjobs: Hotjobs));
                    }),
              ),
              const SizedBox(height: 35.0),
              Text(
                'Recent Jobs',
                style: kTitleStyle,
              ),
              ListView.builder(
                itemCount: hotjobList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  var recent = hotjobList[index];
                  return Card(
                    elevation: 0.0,
                    margin: const EdgeInsets.only(top: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                                image: AssetImage(recent.imageUrl))),
                      ),
                      title: Text(
                        recent.description,
                        style: kTitleStyle,
                      ),
                      subtitle: Text('${recent.title} ⦁ ${recent.jdposition}'),
                      trailing: const Icon(
                        FontAwesomeIcons.fireFlameCurved,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
