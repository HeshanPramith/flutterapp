import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topjobs/main.dart';
import 'package:topjobs/signup.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'package:topjobs/views/home.dart';

import 'constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String googleicon = 'assets/icons/google.svg';
  final String facebookicon = 'assets/icons/facebook.svg';

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: const Color.fromARGB(255, 197, 22, 10),
      ),
    );
  }

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return GestureDetector(
      onVerticalDragDown: (_) {
        hideKeyboard();
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 119, 13, 13),
        body: Container(
          height: double.infinity,
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 20,
                  left: 15,
                  right: 15,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                    ),
                    child: Text(
                      'topjobs',
                      style: kPageTitleStyle.copyWith(
                        fontSize: 38,
                        color: Colors.white,
                        fontFamily: 'Verdana',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 15.0,
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 236, 187, 26),
                      Color.fromARGB(255, 179, 142, 20),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    topRight: Radius.circular(80.0),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 241, 241, 241),
                        Color.fromARGB(255, 216, 216, 216),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                            bottom: 5.0,
                          ),
                          child: const Center(
                            child: Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: const Center(
                            child: Text(
                              'Enter your details below',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 117, 117, 117),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 0, right: 15, bottom: 0, left: 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'User Name',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 0, right: 15, bottom: 0, left: 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black38,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                iconSize: 20,
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          right: 17.0,
                          bottom: 0.0,
                          left: 17.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onTap: () {
                                openDialog();
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 180.0,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(255, 255, 255, 255),
                                  ]),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MyApp(),
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.arrowLeft,
                                        size: 20.0,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'Go Back',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180.0,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 26, 196, 82),
                                      Color.fromARGB(255, 10, 119, 37),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {
                                    String email = _emailController.text;
                                    String password = _passwordController.text;

                                    if (email.isEmpty || password.isEmpty) {
                                      setState(
                                        () {
                                          _errorMessage =
                                              'Please enter both username and password.';
                                        },
                                      );
                                      showErrorMessage(_errorMessage);
                                    } else {
                                      setState(
                                        () {
                                          _errorMessage = '';
                                        },
                                      );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.arrowRightToBracket,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            'Sign in with',
                            style: TextStyle(
                              color: Color.fromARGB(255, 117, 117, 117),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 45.0,
                              width: 180.0,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  googleicon,
                                  height: 30,
                                ),
                                label: const Text(
                                  "Google",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 12,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 45.0,
                              width: 180.0,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  facebookicon,
                                  height: 30,
                                ),
                                label: const Text(
                                  "Facebook",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 21, 70, 143),
                                    fontSize: 12,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.transparent,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 117, 117, 117),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 119, 13, 13),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.only(
            top: 15.0,
            right: 15.0,
            bottom: 5.0,
            left: 15.0,
          ),
          contentPadding: const EdgeInsets.only(
            top: 0.0,
            right: 15.0,
            bottom: 5.0,
            left: 15.0,
          ),
          actionsPadding: const EdgeInsets.only(
            top: 0.0,
            right: 15.0,
            bottom: 15.0,
            left: 15.0,
          ),
          title: const Text(
            'Enter Your Email',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: InputBorder.none,
                filled: true,
                fillColor: const Color.fromARGB(255, 223, 223, 223),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10.0,
                ),
              ),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          actions: [
            Column(
              children: [
                AnimatedButton(
                  height: double.infinity,
                  text: 'Submit',
                  width: 100.0,
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  color: const Color.fromARGB(255, 17, 155, 51),
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: false,
                      title: 'Succes',
                      autoHide: const Duration(seconds: 4),
                      body: Container(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30.0,
                              ),
                              child: Column(
                                children: [
                                  const Text('Please check your email'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onDismissCallback: (type) {
                        Navigator.of(context).pop();
                      },
                    ).show();
                  },
                ),
              ],
            )
          ],
        ),
      );
}
