import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/screens/detail.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'model/hotjobs.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Hotjobs> hotjobList = List.from(Hotjobs.hotjobList);

  void updateList(String value) {
    //Filter our list
    setState(() {
      hotjobList = Hotjobs.hotjobList
          .where(
            (element) =>
                element.description.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _key,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
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
              icon: const Icon(Icons.change_circle_rounded),
              color: Colors.white,
            ),
          ],
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer(); //<-- SEE HERE
            },
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 64.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 124, 14, 14),
                  ),
                  child: Text(
                    "Pick Your Job Category",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ListTile(
                  title: const Text('IT-Sware/DB/QA/Web/Graphics/GIS'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: ListTile(
                  title: const Text('IT-HWare/Networks/Systems'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: ListTile(
                  title: const Text('Accounting/Auditing/Finance'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: ListTile(
                  title: const Text('Banking/Insurance'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: ListTile(
                  title: const Text('Banking/Insurance'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              height: 20,
              width: double.infinity,
              child: Text(
                "Recommended for you",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 12, right: 12),
                scrollDirection: Axis.horizontal,
                itemCount: hotjobList.length,
                itemBuilder: (context, index) {
                  Hotjobs hotjobs = hotjobList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        child: Card(
                          shadowColor: Colors.transparent,
                          child: SizedBox(
                              width: 150,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Image.asset(
                                        hotjobs.imageUrl,
                                        width: 70,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      hotjobs.description,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      hotjobs.expdate,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.green),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddView(hotjobs)));
                        },
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              height: 20,
              width: double.infinity,
              child: Text(
                "Recently added (100+)",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(
                color: Color.fromARGB(255, 54, 54, 54),
                fontSize: 13,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                contentPadding: const EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Eg: Senior Software Engineer",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromARGB(255, 80, 80, 80),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: hotjobList.length,
                itemBuilder: (context, index) {
                  Hotjobs hotjobs = hotjobList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 13, right: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          shadowColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            child: ListTile(
                              title: Text(
                                hotjobs.description,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 5),
                                    Text(
                                      hotjobs.expdate,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 24, 156, 41),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
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
                              trailing: const SizedBox(
                                  height: double.infinity,
                                  child: Icon(
                                    FontAwesomeIcons.fireFlameCurved,
                                    size: 16,
                                    color: Color.fromARGB(255, 230, 49, 36),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddView(hotjobs)));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          // CarouselSlider.builder(
          //   itemCount: carouselimages.length,
          //   itemBuilder: (BuildContext context, int itemIndex, _) =>
          //       Image.asset(
          //     carouselimages[itemIndex],
          //     fit: BoxFit.fitWidth,
          //     width: double.infinity,
          //   ),
          //   options: CarouselOptions(
          //     height: 140.0,
          //     enlargeCenterPage: true,
          //     autoPlay: true,
          //     pauseAutoPlayOnTouch: true,
          //     aspectRatio: 16 / 9,
          //     autoPlayCurve: Curves.easeInOut,
          //     enableInfiniteScroll: true,
          //     autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          //     viewportFraction: 0.8,
          //   ),
          // ),
        ]),
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
