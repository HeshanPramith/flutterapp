import 'package:flutter/material.dart';
import 'package:topjobs/models/hotjobs.dart';
import 'package:topjobs/views/description_tab.dart';
import 'package:topjobs/views/overview_tab.dart';
import '../constants.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key, required this.hotjobs});

  final Hotjobs hotjobs;

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 13, 13),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.hotjobs.title,
          style: kTitleStyle.copyWith(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: 'Verdana',
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 140.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(widget.hotjobs.imageUrl))),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.hotjobs.description,
                      style: kPageTitleStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '${widget.hotjobs.jobref} ⦁ ${widget.hotjobs.jbexp} ⦁ ${widget.hotjobs.jbsalary}',
                      style: kTitleStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      widget.hotjobs.jbtechnology,
                      style: kTitleStyle,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.hotjobs.tag
                          .map((e) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: kBlack.withOpacity(.5),
                                  ),
                                ),
                                child: Text(e,
                                    style: kTitleStyle.copyWith(fontSize: 11)),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                          color: kBlack.withOpacity(.2),
                        ),
                      ),
                      child: TabBar(
                        indicatorPadding: const EdgeInsets.all(3.0),
                        unselectedLabelColor:
                            const Color.fromARGB(255, 116, 116, 116),
                        indicatorColor: Colors.white,
                        indicator: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(5)),
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(fontSize: 16),
                        tabs: const [
                          Tab(
                            text: 'Job Overview',
                          ),
                          Tab(
                            text: 'Company',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    OverviewTab(hotjobs: widget.hotjobs),
                    DescriptionTab(hotjobs: widget.hotjobs)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
                left: 15.0, bottom: 15.0, right: 15.0, top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 64, 115, 209),
                          width: 2),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          click = !click;
                        });
                      },
                      child: Icon(
                        (click == false)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: const Color.fromARGB(255, 64, 115, 209),
                      )),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Apply Now',
                        style: kPageTitleStyle.copyWith(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
