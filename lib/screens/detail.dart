import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  final int index;

  const AddView(this.index, {super.key});

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
      body: Column(
        children: [
          Image.asset('assets/ads/1022c9hx.png'),
        ],
      ),
    );
  }
}
