import 'package:flutter/material.dart';
import 'package:testapp/const.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int height = 50;
  int weight = 70;

  late double total = calbmi(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_back_ios_new, size: 30),
                        Text("Back"),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.settings, size: 30),
                        Text("Settings"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Left Data"),
                        Text(
                          "$height",
                          style: kbasemix,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  total =
                                      calbmi(height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 180) height++;
                                  total =
                                      calbmi(height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Right Data"),
                        Text(
                          "$weight",
                          style: kbasemix,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 40) weight--;
                                  total =
                                      calbmi(height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                  total =
                                      calbmi(height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("My Data"),
                  Text(
                    total.toStringAsFixed(2),
                    style: ktotal,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calbmi({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }
}
