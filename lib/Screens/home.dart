import "package:flutter/material.dart";

import 'package:whack_a_mole/Screens/high_score.dart';
import 'package:whack_a_mole/Screens/game_start.dart';
import 'package:whack_a_mole/Screens/about.dart';
import 'package:whack_a_mole/Screens/score_validator.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';
import 'package:whack_a_mole/Widgets/animated_circle_button.dart';
import 'package:whack_a_mole/Widgets/background.dart';
import "package:whack_a_mole/Widgets/menu_button.dart";


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
              MenuButton(
                text: "New game",
                color: ThemeColors.lightBlue,
                fontWeight: FontWeight.bold,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context) => const GameStart()));
                },
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScoreValidator()));
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
