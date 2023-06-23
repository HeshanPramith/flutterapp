import 'package:flutter/material.dart';
import 'package:topjobs/screens/detail.dart';

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
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    final items = [
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

    final subtitles = [
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

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(items[index]),
            subtitle: Text(subtitles[index]),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddView(index)));
              },
            ),
          ),
        );
      },
    );
  }
}
