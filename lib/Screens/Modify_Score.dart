import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:whack_a_mole/Style/theme_colors.dart';
import '../Widgets/insert_score_form.dart';
import "package:whack_a_mole/Widgets/menu_button.dart";
import "package:whack_a_mole/Widgets/background.dart";
import 'package:whack_a_mole/Screens/listHighScore.dart';

class ModifyScore extends StatefulWidget {
  const ModifyScore({super.key});

  @override
  State<ModifyScore> createState() => _InsertScoreState();
}

class _InsertScoreState extends State<ModifyScore> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = "";
  int _score = 0;
  int _id = 0;
  final myController = TextEditingController();
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
            Padding( // Padding
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              //height 
              child: Container(
                  height: 325,
                  width: double.infinity,
                  child: ListTileSelectExample(),
                  ),
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
            
            Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    controller: myController,
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
                text: "UPDATE SCORE",
                color: ThemeColors.lightBlue,
                action: () {
                  _formKey.currentState
                      ?.validate();
                      log('data: '); //Les validations log la valeur
                      if(myController.text.isNotEmpty && int.parse(myController.text) > 0 ){           
                         Navigator.of(context).popUntil((route) => route.isFirst);
                      }
                },
              ),
            ),
          ],
        ),
      ),
    ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: MenuButton(
                text: "DELETE SCORE(S)",
                color: ThemeColors.lightBlue,
                action: () {
                  _formKey.currentState
                      ?.validate(); //Les validations log la valeur
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
            const Spacer()
          ]),
        )
      ]),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
