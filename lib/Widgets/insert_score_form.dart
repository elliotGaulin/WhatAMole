import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Screens/high_score.dart';
import 'package:whack_a_mole/services/highScore.service.dart';

import '../Style/theme_colors.dart';
import 'menu_button.dart';

class InsertScoreForm extends StatefulWidget {
  const InsertScoreForm({super.key});

  @override
  State<InsertScoreForm> createState() => _InsertScoreFormState();
}

class _InsertScoreFormState extends State<InsertScoreForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "";
  int _score = 0;
  int _id = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "NAME: ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    cursorColor: Colors.purple,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2))),
                    onSaved: ((newValue) {
                      _name = newValue!;
                    }),
                    //TODO : validation
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "SCORE: ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2))),
                    onSaved: ((newValue) {
                      _score = int.parse(newValue!);
                    }),
                    //TODO : validation
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: MenuButton(
                text: "SUBMIT SCORE",
                color: ThemeColors.lightBlue,
                action: () {
                  _formKey.currentState
                      ?.validate(); //Les validations log la valeur
                  _formKey.currentState?.save();
                  inserthighScore(HighScoreEntity(
                      id: _id,
                      username: _name,
                      score: _score,
                      dateTime: DateTime.now()));
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
