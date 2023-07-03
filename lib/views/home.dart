import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/hotjobs.dart';
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

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      child: Scaffold(
        key: _key,
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 119, 13, 13), // <-- SEE HERE
            statusBarIconBrightness:
                Brightness.light, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness:
                Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.barsStaggered,
                color: Colors.white,
              )),
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
              fontWeight: FontWeight.w400,
              fontFamily: 'Verdana',
            ),
          ),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowRotateRight),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          margin:
              const EdgeInsets.only(top: 5, right: 18, bottom: 18, left: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Hi Welcome!,',
                  style: kPageTitleStyle,
                ),
                Text(
                  'Find your Dream Job',
                  style: kPageTitleStyle.copyWith(
                    fontSize: 16,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            onChanged: (value) => updateList(value),
                            cursorColor: kBlack,
                            decoration: const InputDecoration(
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
                            color: Color.fromARGB(255, 119, 13, 13),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                            onTap: () {},
                            child: index == 0
                                ? PopularCard(hotjobs: Hotjobs)
                                : PopularCard2(hotjobs: Hotjobs));
                      }),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Recent Jobs',
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
                    var recent = hotjobList[index];
                    return Card(
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
                                    image: AssetImage(recent.imageUrl))),
                          ),
                          title: Text(
                            recent.description,
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
                                  '${recent.title} ⦁ ${recent.jdposition}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  recent.expdate,
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
