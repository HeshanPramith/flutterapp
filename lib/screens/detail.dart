import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:topjobs/model/hotjobs.dart';
import 'package:topjobs/screens/tabdescription.dart';
import 'package:topjobs/screens/taboverview.dart';

class AddView extends StatefulWidget {
  final Hotjobs hotjobs;

  const AddView(this.hotjobs, {super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            icon: const Icon(Icons.share),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              widget.hotjobs.imageUrl,
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 10,
                        child: Text(
                          widget.hotjobs.description,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: SizedBox(
                    height: 45,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Experience\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jbexp,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Technology\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jbtechnology,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Exp Date\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.expdate,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Job Ref No\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jobref,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Status\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jdposition,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Location\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jblocation,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Salary\n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 133, 133, 133)),
                                  children: [
                                    TextSpan(
                                      text: widget.hotjobs.jbsalary,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ]),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 287,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 230,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: TabBar(
                                indicatorPadding: const EdgeInsets.all(5),
                                unselectedLabelColor:
                                    const Color.fromARGB(255, 116, 116, 116),
                                indicatorColor: Colors.white,
                                indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                labelColor: Colors.black,
                                controller: tabController,
                                tabs: const [
                                  Tab(
                                    text: 'Overview',
                                  ),
                                  Tab(
                                    text: 'Description',
                                  )
                                ]),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: TabBarView(
                            controller: tabController,
                            children: const [
                              Overviewtab(),
                              Descriptiontab(),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 36, 173, 59),
                        minimumSize: const Size.fromHeight(50),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'QUICK APPLY',
                        style: TextStyle(fontSize: 18),
                      ),
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
                          height: 120,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.easeInOut,
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
