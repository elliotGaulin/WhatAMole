import 'package:flutter/material.dart';
import "package:whack_a_mole/Widgets/background.dart";
import 'package:whack_a_mole/Widgets/score_validator_form.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';

class ScoreValidator extends StatefulWidget {
  @override
  State<ScoreValidator> createState() => _ScoreValidatorState();
}

class _ScoreValidatorState extends State<ScoreValidator> {
  String scoreExists = ""; 


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
              "SCORE VALIDATOR",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            ScoreValitatorForm(setScoreExists: setScoreExists),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            Text("Score exists : $scoreExists", style: const TextStyle(color: Colors.white, fontSize: 18),),
            const Spacer()
          ]),
        )
      ]),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }

  void setScoreExists(String scoreExists) {
    setState(() {
      this.scoreExists = scoreExists;
    });
  }

}
