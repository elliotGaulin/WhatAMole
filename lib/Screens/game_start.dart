import "package:flutter/material.dart";
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Screens/insert_score.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';
import '../Widgets/animated_circle_button.dart';
import '../Widgets/background.dart';
import '../services/highScore.service.dart';

class GameStart extends StatelessWidget {
  const GameStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Center(
            child: Column(children: [
              const Spacer(),
              AnimatedCircleButton(
                size: Size.square(50),
                color: ThemeColors.lightBlue,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InsertScore()));
                },
              ),
              const Text(
                "TAP THE",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Text(
                "CIRCLE TO START",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Spacer(),
            ]),
          )
        ],
      ),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
