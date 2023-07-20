import 'package:flutter/material.dart';
import 'package:topjobs/views/experience_items.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.blue,
  ];

  late List<TimelineCard> timeline;

  @override
  void initState() {
    super.initState();
    timeline = _getCards();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Experience', // Your title goes here
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: timeline.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 2,
                              height: 35,
                              color: index == 0 ? Colors.white : Colors.black12,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colors[(index + 1) % 5],
                                borderRadius: BorderRadius.circular(
                                  50.0,
                                ),
                              ),
                              child: Icon(
                                timeline[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 35,
                              color: index == timeline.length - 1
                                  ? Colors.white
                                  : Colors.black12,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 15.0,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(0, 255, 255, 255),
                                  Color.fromARGB(255, 231, 231, 231),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                                right: 15.0,
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    timeline[index].title,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text(
                                      timeline[index].description,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Image.network(
                                    timeline[index].image,
                                    height: 17.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TimelineCard> _getCards() {
    List<TimelineCard> timelineCard = [];

    timelineCard.add(
      TimelineCard(
          'Senior UI/UX Engineer/Designer',
          'Genesiis Software (Pvt) Ltd',
          Icons.check,
          'https://www.genesiis.com/wp-content/themes/Genesiis/assets/img/logo.png'),
    );
    timelineCard.add(
      TimelineCard(
          'Senior UI/UX Engineer/Designer',
          'QualitApps Europe',
          Icons.hourglass_empty,
          'https://qualitapps.lk/wp-content/uploads/2023/03/qualitapps-logo.png'),
    );
    timelineCard.add(
      TimelineCard(
          'UI/UX Engineer/Designer',
          'attune - RIZING',
          Icons.hourglass_empty,
          'https://i.ibb.co/kMn5Rw7/Screenshot-2023-07-20-152654.png'),
    );
    timelineCard.add(
      TimelineCard('UI/UX Engineer', 'One Creations Limited',
          Icons.hourglass_empty, 'https://i.ibb.co/VLmQZfj/1519877576763.jpg'),
    );
    timelineCard.add(
      TimelineCard('Hardware Engineer', 'PTS', Icons.hourglass_empty,
          'https://i.ibb.co/pn9ZL98/300366968-748973089835699-5201023380643147406-n.jpg'),
    );

    return timelineCard;
  }
}
