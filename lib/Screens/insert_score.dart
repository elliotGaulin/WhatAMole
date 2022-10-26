import "package:flutter/material.dart";
import 'package:whack_a_mole/Style/theme_colors.dart';
import '../Widgets/insert_score_form.dart';
import '../Widgets/menu_button.dart';

import 'package:flutter/material.dart';
import "package:whack_a_mole/Widgets/background.dart";
import 'package:whack_a_mole/Widgets/score_validator_form.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';

class InsertScore extends StatefulWidget {
  const InsertScore({super.key});

  @override
  State<InsertScore> createState() => _InsertScoreState();
}

class _InsertScoreState extends State<InsertScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        Positioned(
            top: 25,
            left: 15,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("images/backIcon.png"),
                    width: 65,
                    height: 65,
                  ),
                  Text(
                    "BACK",
                    style: TextStyle(
                        color: ThemeColors.lightBlue,
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        height: 0.5),
                  ),
                ],
              ),
            )),
        Center(
          child: Column(children: [
            const Spacer(),
            Image.asset(
              "images/validate.png",
              height: 100,
            ),
            const Text(
              "SCORE SUBMITOR",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            InsertScoreForm(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            const Spacer()
          ]),
        )
      ]),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
