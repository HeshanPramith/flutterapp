import 'package:flutter/material.dart';
import 'package:topjobs/screens/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'model/hotjobs.dart';

void main() => runApp(const Mainpage());

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JobList",
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'topjobs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
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
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        body: Column(children: [
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
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(
            height: 20,
            child: Center(
              child: Text(
                "Hot Jobs (100+)",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 161, 27, 27),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: hotjobList.length,
                itemBuilder: (context, index) {
                  Hotjobs hotjobs = hotjobList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          child: ListTile(
                            title: Text(
                              hotjobs.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(height: 5),
                                  Text(
                                    hotjobs.description,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Please refer the vacancy",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ]),
                            leading: SizedBox(
                              height: double.infinity,
                              child: Image.asset(
                                hotjobs.imageUrl,
                                width: 50,
                              ),
                            ),
                            trailing: SizedBox(
                              height: double.infinity,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_sharp),
                                alignment: const Alignment(3, 0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddView(hotjobs)));
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ]));
  }

  final carouselimages = const [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png'
  ];
}
