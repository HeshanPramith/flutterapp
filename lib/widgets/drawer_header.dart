import 'package:flutter/material.dart';

class TjDrawerHeader extends StatefulWidget {
  const TjDrawerHeader({super.key});

  @override
  State<TjDrawerHeader> createState() => _TjDrawerHeaderState();
}

class _TjDrawerHeaderState extends State<TjDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 119, 13, 13),
      width: double.infinity,
      height: 200.0,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 80.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/user.jpg'))),
          ),
          const Text(
            'Heshan Pramith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'heshan@genesiis.com',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
