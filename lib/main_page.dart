import 'package:flutter/material.dart';
import 'package:topjobs/screens/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 15),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 100.0,
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
          const SizedBox(height: 5),
          const SizedBox(
            //color: Colors.white,
            height: 50,
            child: Center(
              child: Text(
                "Hot Jobs (33)",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 161, 27, 27),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: ListTile(
                        title: Text(jobs[index]),
                        //subtitle: Text(company[index]),
                        subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 5),
                              Text(company[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                              const SizedBox(height: 5),
                              Text(date[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 15, 143, 81),
                                    fontWeight: FontWeight.normal,
                                  )),
                            ]),
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 200, 45, 45),
                          child: Icon(Icons.local_fire_department,
                              color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          alignment: const Alignment(3, 0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddView(index)));
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 34,
            ),
          ),
        ],
      ),
    );
  }

  final jobs = const [
    'Ful-Stack Developer - SSE Java',
    'UI/UX Engineer - SSE',
    'QA Engineer',
    'Project Manager',
    'HR - Intern',
    'Production Executive - Printing',
    'Manager (R&D)',
    'Assistant Engineer (Sales)',
    'Receptionist (Male)',
    'Ful-Stack Developer - SSE Java',
    'UI/UX Engineer - SSE',
    'QA Engineer',
    'Project Manager',
    'HR - Intern',
    'Production Executive - Printing',
    'Manager (R&D)',
    'Assistant Engineer (Sales)',
    'Receptionist (Male)',
    'Ful-Stack Developer - SSE Java',
    'UI/UX Engineer - SSE',
    'QA Engineer',
    'Project Manager',
    'HR - Intern',
    'Production Executive - Screen Printing',
    'Manager (R&D)',
    'Assistant Engineer (Sales / Mechanical)',
    'Receptionist (Male)',
    'Ful-Stack Developer - SSE Java',
    'UI/UX Engineer - SSE',
    'QA Engineer',
    'Project Manager',
    'HR - Intern',
    'Production Executive - Screen Printing',
    'Manager (R&D)',
    'Assistant Engineer (Sales / Mechanical)',
    'Receptionist (Male)',
  ];

  final company = const [
    "GENESIIS",
    "Dialog",
    "WSO2",
    "Virtusa",
    "Sysco Labs",
    "ISM APAC",
    "MIT",
    "SLT",
    "Creative Solutions",
    "GENESIIS",
    "Dialog",
    "WSO2",
    "Virtusa",
    "Sysco Labs",
    "ISM APAC",
    "MIT",
    "SLT",
    "Creative Solutions",
    "GENESIIS",
    "Dialog",
    "WSO2",
    "Virtusa",
    "Sysco Labs",
    "ISM APAC",
    "MIT",
    "SLT",
    "Creative Solutions",
    "GENESIIS",
    "Dialog",
    "WSO2",
    "Virtusa",
    "Sysco Labs",
    "ISM APAC",
    "MIT",
    "SLT",
    "Creative Solutions",
  ];

  final date = const [
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
    "01-01-2023 - 10-05-2023",
  ];

  // final List<String> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  // ];

  // ListView _buildListView(BuildContext context) {
  //   final items = [
  //     'Ful-Stack Developer - SSE Java',
  //     'UI/UX Engineer - SSE',
  //     'QA Engineer',
  //     'Project Manager',
  //     'HR - Intern',
  //     'Production Executive - Screen Printing',
  //     'Manager (R&D)',
  //     'Assistant Engineer (Sales / Mechanical)',
  //     'Receptionist (Male)',
  //     'Ful-Stack Developer - SSE Java',
  //     'UI/UX Engineer - SSE',
  //     'QA Engineer',
  //     'Project Manager',
  //     'HR - Intern',
  //     'Production Executive - Screen Printing',
  //     'Manager (R&D)',
  //     'Assistant Engineer (Sales / Mechanical)',
  //     'Receptionist (Male)',
  //   ];

  //   final subtitles = [
  //     "GENESIIS" '01-01-2023 - 10-05-2023',
  //     "Dialog",
  //     "WSO2",
  //     "Virtusa",
  //     "Sysco Labs",
  //     "ISM APAC",
  //     "MIT",
  //     "SLT",
  //     "Creative Solutions",
  //     "GENESIIS",
  //     "Dialog",
  //     "WSO2",
  //     "Virtusa",
  //     "Sysco Labs",
  //     "ISM APAC",
  //     "MIT",
  //     "SLT",
  //     "Creative Solutions",
  //   ];

  //   return ListView.builder(
  //     padding: const EdgeInsets.all(8),
  //     itemCount: items.length,
  //     itemBuilder: (context, index) {
  //       return Card(
  //         child: ListTile(
  //           title: Text(items[index]),
  //           leading: CircleAvatar(
  //             backgroundColor: const Color(0xff764abc),
  //             child: Text(items[index]),
  //           ),
  //           subtitle: Text(subtitles[index]),
  //           minLeadingWidth: 0,
  //           trailing: IconButton(
  //             icon: const Icon(Icons.arrow_forward_ios_outlined),
  //             alignment: const Alignment(3, 0),
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => AddView(index)));
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
