import 'dart:async';

import "package:flutter/material.dart";

import 'package:whack_a_mole/Widgets/animated_circle_button.dart';
import 'package:whack_a_mole/Widgets/background.dart';
import 'package:whack_a_mole/Widgets/home.dart';

class About extends StatefulWidget {
  static const Color lightBlue = Color.fromARGB(255, 78, 186, 227);
  static const aboutText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  const About({
    Key? key,
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<Color> colors = [Home.lightBlue.withOpacity(0.5), Colors.transparent];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: 0.5,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 24, right: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 20),
                child: Column(
                  children: const [
                    Text(
                      "ABOUT",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, height: 2),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      About.aboutText,
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
              ),
              AnimatedCircleButton(
                size: const Size.square(50),
                color: Colors.white,
                action: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
      backgroundColor: const Color.fromARGB(255, 10, 29, 49),
    );
  }
}
