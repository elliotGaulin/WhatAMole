import "package:flutter/material.dart";

import 'package:whack_a_mole/Widgets/animated_circle_button.dart';
import 'package:whack_a_mole/Widgets/background.dart';
import 'package:whack_a_mole/Widgets/high_score.dart';
import "package:whack_a_mole/Widgets/menu_button.dart";
import "package:whack_a_mole/Widgets/about.dart";
import 'package:whack_a_mole/theme_colors.dart';


class Home extends StatelessWidget {
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
                color: ThemeColors.lightBlue,
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
                style: TextStyle(color: ThemeColors.lightBlue, fontSize: 18),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const MenuButton(
                text: "New game",
                color: ThemeColors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
              MenuButton(
                text: "High score",
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HighScore()));
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
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
