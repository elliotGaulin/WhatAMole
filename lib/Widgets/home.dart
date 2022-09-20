import "package:flutter/material.dart";

import 'package:whack_a_mole/Widgets/animated_circle_button.dart';
import 'package:whack_a_mole/Widgets/background.dart';
import "package:whack_a_mole/Widgets/menu_button.dart";
import "package:whack_a_mole/Widgets/about.dart";

class Home extends StatelessWidget {
  static const Color lightBlue = Color.fromARGB(255, 78, 186, 227);

  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        Center(
          child: Column(
            children: [
              const Spacer(),
              const AnimatedCircleButton(
                size: Size.square(65),
                color: lightBlue,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                "WHACK-A-MOLE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const Text(
                "EVERY TAP MATTERS",
                style: TextStyle(color: lightBlue, fontSize: 18),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const MenuButton(
                text: "New game",
                color: lightBlue,
                bold: true,
              ),
              MenuButton(
                text: "High score",
                action: () {
                  debugPrint("MANGE MA FUCKING GRAINE");
                },
              ),
              MenuButton(
                text: "Score validator",
                action: () {
                  debugPrint("MANGE MA FUCKING GRAINE");
                },
              ),
              MenuButton(
                text: "About",
                action: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
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
