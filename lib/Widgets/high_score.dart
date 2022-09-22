import "package:flutter/material.dart";
import 'package:whack_a_mole/theme_colors.dart';
import 'package:whack_a_mole/Widgets/high_score_list.dart';
import 'package:whack_a_mole/Widgets/menu_button.dart';
import "background.dart";

class HighScore extends StatelessWidget {
  const HighScore({
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
              const Text("HIGHSCORES",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w600, height: 2)),
              const SizedBox(
                height: 500,
                child: HighScoreList()),
              MenuButton(
                color: ThemeColors.lightBlue,
                textColor: Colors.white,
                text: "BACK TO MENU",
                action: () {
                  Navigator.of(context).pop();
                },
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
