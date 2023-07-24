import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List<String> skillsList = [
    'Flutter',
    'React',
    'Angular',
    'Vue.js',
    'HTML5',
    'SCSS',
    'CSS3',
    'Bootstrap',
    '960gs',
    'SAP Fiori',
    'Wordpress',
    'PHP',
    'Adobe',
  ];
  int _selectedIndex = -1;
  void showEditDialog(String skill, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedSkill = skill;
        return AlertDialog(
          title: const Text('Edit Skill'),
          content: TextFormField(
            initialValue: skill,
            onChanged: (newValue) {
              updatedSkill = newValue;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    skillsList[index] = updatedSkill;
                    _selectedIndex = -1;
                  },
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Experience',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const ExperienceItem(
            title: 'Senior UI/UX Engineer/Designer',
            company: 'Genesiis Software (Pvt) Ltd',
            duration: 'Feb 2022 - Present · 1 yr 6 mos',
            imagePath:
                'https://www.genesiis.com/wp-content/themes/Genesiis/assets/img/logo.png',
          ),
          const SizedBox(height: 10.0),
          const ExperienceItem(
            title: 'Senior UI/UX Engineer',
            company: 'QualitApps Europe',
            duration: 'Apr 2021 - Dec 2021 · 9 mos',
            imagePath:
                'https://qualitapps.lk/wp-content/uploads/2023/03/qualitapps-logo.png',
          ),
          const SizedBox(height: 10.0),
          const ExperienceItem(
            title: 'UI/UX Engineer/Designer',
            company: 'attune',
            duration: 'Feb 2015 - Oct 2020 · 5 yrs 9 mos',
            imagePath:
                'https://media.licdn.com/dms/image/C560BAQHt7MjwSyhvoA/company-logo_100_100/0/1661172253796?e=1698278400&v=beta&t=LEXTZtsbcXvf3P7VDtKBC4ROynOEXB7zMDfYryW1RFU',
          ),
          const SizedBox(height: 10.0),
          const ExperienceItem(
            title: 'UI/UX Engineer',
            company: 'One Creations Limited',
            duration: 'Mar 2010 - Feb 2015 · 5 yrs',
            imagePath:
                'https://media.licdn.com/dms/image/C560BAQFEkgB0lkbV6w/company-logo_200_200/0/1519877576763?e=1698278400&v=beta&t=ufkWw4qZdT1o7kmedJKE4atHloVxhmuvOI4WE8p2Mqk',
          ),
          const SizedBox(height: 10.0),
          const ExperienceItem(
            title: 'Hardware Engineer',
            company: 'PTS',
            duration: 'Sep 2009 - Feb 2010 · 6 mos',
            imagePath:
                'https://scontent.fcmb2-2.fna.fbcdn.net/v/t39.30808-6/300366968_748973089835699_5201023380643147406_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jj6WM7ZJbRgAX9fz6TU&_nc_ht=scontent.fcmb2-2.fna&oh=00_AfAGip274U7lvrEe9mNlpDTVfRsi124khTsTyM5C8fo9pg&oe=64BF7661',
          ),
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 8.0,
            children: List.generate(
              skillsList.length,
              (index) {
                String skill = skillsList[index];
                bool isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    showEditDialog(skill, index);
                  },
                  child: ChoiceChip(
                    label: Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (bool newBoolValue) {
                      setState(
                        () {
                          _selectedIndex = newBoolValue ? index : -1;
                        },
                      );
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey,
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final String imagePath;

  const ExperienceItem({
    Key? key,
    required this.title,
    required this.company,
    required this.duration,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network(
              imagePath,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 20.0),
      ],
    );
  }
}
