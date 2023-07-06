import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topjobs/constants.dart';
import 'package:topjobs/models/categories.dart';
import 'package:topjobs/models/categorydata.dart';
import 'package:topjobs/views/home.dart';

import 'package:http/http.dart' as http;
//import 'package:provider/provider.dart';

class Jobcategory extends StatefulWidget {
  const Jobcategory({super.key, required this.category});

  final Category category;

  @override
  State<Jobcategory> createState() => _JobcategoryState();
}

class _JobcategoryState extends State<Jobcategory> {
  List<Category> categoryList = List.from(Category.categoryList);

  List<CategoryData> categoryData = [];

  void rssResponce() {
    final client = http.Client();

    // RSS feed
    client
        .get(Uri.parse(
            'http://www.topjobs.lk/rss/it_sware_db_qa_web_graphics_gis.rss'))
        .then((response) {
      return response.body;
    }).then((bodyString) {
      final channel = RssFeed.parse(bodyString);

      setState(() {
        // ignore: avoid_function_literals_in_foreach_calls
        channel.items.forEach((e) {
          categoryData.add(CategoryData(e.title, e.description));
        });
      });
      // ignore: avoid_print
      print('text : ${channel.items[0].title}');
      return channel;
    });
  }

  @override
  void initState() {
    rssResponce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          // onPressed: () => Navigator.pop(context),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        title: Text(
          widget.category.category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Verdana',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.repeat),
            color: Colors.white,
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                backgroundColor: const Color.fromARGB(0, 119, 13, 13),
                builder: (BuildContext context) {
                  return Container(
                    height: 300,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 172, 24, 24),
                            Color.fromARGB(255, 83, 9, 9),
                            Color.fromARGB(255, 56, 5, 5),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0))),
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: categoryList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var category = categoryList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 200),
                                    child: Jobcategory(category: category)));
                          },
                          child: ListTile(
                            title: Text(
                              category.category,
                              style: kTitleStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Container(
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
            topRight: Radius.circular(40.0),
          ),
        ),
        child: ListView.builder(
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                        '${categoryData[index].title!} \n${categoryData[index].description!}'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 10),
                  //   child: Text(categoryData[index].description!),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
      // body: Center(
      //   child: Flexible(
      //     child: ListView.builder(
      //       itemCount: categoryData.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           child: Text(categoryData[index].title!),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
