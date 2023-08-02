import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:topjobs/views/account_data.dart';
import 'package:topjobs/welcomepage.dart';
import 'package:topjobs/widgets/drawer_content.dart';
import 'package:topjobs/widgets/drawer_header.dart';

class Myaccount extends StatefulWidget {
  const Myaccount({super.key});

  @override
  State<Myaccount> createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // ignore: unused_field
  PickedFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 119, 13, 13),
          title: const Text('My Profile'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 100),
                    child: const WelcomePage(
                      rssCounts: [],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 190.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 119, 13, 13),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 119, 13, 13),
                      Color.fromARGB(255, 153, 19, 19),
                      Color.fromARGB(255, 184, 49, 25),
                      Color.fromARGB(255, 233, 163, 34),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [imageProfile()],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Heshan Pramith',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 5.0,
                            left: 15.0,
                            right: 15.0,
                          ),
                          child: Text.rich(
                            TextSpan(
                              text: 'Complete Your Profile ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '(1/4)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: SimpleAnimationProgressBar(
                            height: 15,
                            width: MediaQuery.of(context).size.width,
                            backgroundColor:
                                const Color.fromARGB(255, 199, 199, 199),
                            foregrondColor:
                                const Color.fromARGB(255, 24, 204, 69),
                            ratio: 0.5,
                            direction: Axis.horizontal,
                            curve: Curves.slowMiddle,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.pink,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                        ),
                        const Experience(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          elevation: 0,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Column(
                children: [
                  TjDrawerHeader(),
                  TjDrawerContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(108, 255, 255, 255),
                spreadRadius: 5,
              )
            ],
          ),
          child: CircleAvatar(
            radius: 55,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: _imageFile?.path != null
                  ? FileImage(File(_imageFile!.path)) as ImageProvider<Object>?
                  : const AssetImage('assets/images/user2.jpg'),
            ),
          ),
        ),
        Positioned(
          left: 40.0,
          top: 40.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white54,
              size: 28.0,
            ),
          ),
        ),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      final PickedFile pickedImage = PickedFile(pickedFile.path);
      setState(() {
        _imageFile = pickedImage;
      });
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
