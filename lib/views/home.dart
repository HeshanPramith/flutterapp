import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/categories.dart';
import 'package:topjobs/models/feedlist.dart';
import 'package:topjobs/models/hotjobs.dart';
import 'package:topjobs/views/job_detail.dart';
import 'package:topjobs/welcomepage.dart';
import 'package:topjobs/widgets/drawer_content.dart';
import 'package:topjobs/widgets/drawer_header.dart';
import 'package:topjobs/widgets/popular_card.dart';
import 'package:topjobs/widgets/popular_card2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Hotjobs> hotjobList = List.from(Hotjobs.hotjobList);

  List<Category> categoryList = List.from(Category.categoryList);

  void updateList(String value) {
    //Filter our list
    setState(
      () {
        hotjobList = Hotjobs.hotjobList
            .where(
              (element) => element.description.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
            )
            .toList();
      },
    );
  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      child: Scaffold(
        key: _key,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 0, 0, 0),
            statusBarIconBrightness:
                Brightness.light, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness:
                Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromARGB(255, 119, 13, 13),
                    Color.fromARGB(255, 119, 13, 13)
                  ]),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'topjobs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Verdana',
            ),
          ),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowRotateRight),
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 100),
                    child: const MyHomePage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 100),
                    child: const WelcomePage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Color.fromARGB(255, 216, 216, 216),
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          padding:
              const EdgeInsets.only(top: 20, right: 15, bottom: 18, left: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'topjobs',
                  style: TextStyle(
                    color: Color.fromARGB(255, 119, 13, 13),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Verdana',
                  ),
                ),
                Text(
                  'Recruitment Made Easy',
                  style: kPageTitleStyle.copyWith(
                    fontSize: 16,
                    fontFamily: 'Verdana',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                              color: const Color.fromARGB(255, 119, 13, 13),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) => updateList(value),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Hot Jobs/Recent Jobs',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(111, 255, 255, 255)),
                              icon: FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                size: 18,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 48.0,
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 119, 13, 13),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 13),
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: const Icon(
                                FontAwesomeIcons.sliders,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 200),
                                    child: const RSSFeedScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Recent Jobs',
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
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: hotjobList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // ignore: non_constant_identifier_names
                      var Hotjobs = hotjobList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 200),
                              child: JobDetail(hotjobs: Hotjobs),
                            ),
                          );
                        },
                        child: index == 0
                            ? PopularCard(hotjobs: Hotjobs)
                            : PopularCard2(hotjobs: Hotjobs),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Hot Jobs',
                  style: kTitleStyle,
                ),
                ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: hotjobList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var htjobs = hotjobList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 200),
                                child: JobDetail(hotjobs: htjobs)));
                      },
                      child: Card(
                        elevation: 0.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                      image: AssetImage(htjobs.imageUrl))),
                            ),
                            title: Text(
                              htjobs.description,
                              style: kTitleStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${htjobs.title} ⦁ ${htjobs.jdposition}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    htjobs.expdate,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 24, 156, 41),
                                    ),
                                  ),
                                ]),
                            trailing: const Icon(
                              FontAwesomeIcons.fireFlameCurved,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 0,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Column(
                children: [
                  TjDrawerHeader(),
                  TjDrawerContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
