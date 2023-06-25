import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:topjobs/model/hotjobs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddView extends StatelessWidget {
  final Hotjobs hotjobs;

  const AddView(this.hotjobs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vacancy View',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Verdana',
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 177, 35, 35),
                  Color.fromARGB(255, 119, 13, 13)
                ]),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  hotjobs.imageUrl,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 0),
                  child: Text(
                    hotjobs.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    hotjobs.expdate.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 38, 138, 41),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(hotjobs.artwork)),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 36, 173, 59),
                        minimumSize: const Size.fromHeight(50),
                        shadowColor: Colors.transparent,
                      ),
                      icon: const FaIcon(FontAwesomeIcons.checkToSlot),
                      label: const Text('APPLY NOW'),
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: carouselimages.length,
                        itemBuilder: (BuildContext context, int itemIndex, _) =>
                            Image.asset(
                          carouselimages[itemIndex],
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 140.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final carouselimages = const [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png'
  ];
}
