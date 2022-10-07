import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whack_a_mole/Widgets/menu_button.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';

class ScoreValitatorForm extends StatefulWidget {
  Function? setScoreExists; 
   ScoreValitatorForm({this.setScoreExists ,super.key});

  @override
  State<ScoreValitatorForm> createState() => _ScoreValitatorFormState();
}

class _ScoreValitatorFormState extends State<ScoreValitatorForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final random = Random();

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
                  "DATE: ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    cursorColor: Colors.purple,
                    decoration: const InputDecoration(
                        hintText: "DD/MM/YYYY",
                        hintStyle: TextStyle(color: ThemeColors.lightBlue),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2))),
                    validator: (value) {
                      //Log valeur à la validation
                      debugPrint(value);
                      return null;
                    },
                  ),
                )
              ],
            ),
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
                    validator: (value) {
                      //Log valeur à la validation
                      debugPrint(value);
                      return null;
                    },
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
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.lightBlue, width: 2))),
                    validator: (value) {
                      //Log valeur à la validation
                      debugPrint(value);
                      return null;
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: MenuButton(
                text: "VALIDATE SCORE",
                color: ThemeColors.lightBlue,
                action: () {
                  _formKey.currentState?.validate(); //Les validations log la valeur 
                  widget.setScoreExists?.call(random.nextBool() ? "yes" : "no" ); //Random entre oui et non
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
