import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'dart:developer';
import 'package:whack_a_mole/Style/theme_colors.dart';
import "package:whack_a_mole/Widgets/menu_button.dart";
import "package:whack_a_mole/Widgets/background.dart";
import 'package:whack_a_mole/services/highScore.service.dart';

class ModifyScore extends StatefulWidget {
  HighScoreEntity highScoreEntity;

  ModifyScore({super.key, required this.highScoreEntity});

  @override
  State<ModifyScore> createState() => _InsertScoreState();
}

class _InsertScoreState extends State<ModifyScore> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = "";
  int score = 0;
  int id = 0;
  final scoreController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.highScoreEntity.username;
    scoreController.text = widget.highScoreEntity.score.toString();
  }

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
            const Text(
              "SCORE SUBMITOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
                          "NAME: ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            cursorColor: Colors.purple,
                            controller: nameController,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColors.lightBlue,
                                        width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColors.lightBlue,
                                        width: 2))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                            onSaved: ((newValue) {
                              print(newValue);
                              name = newValue!;
                            }),
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            cursorColor: Colors.purple,
                            keyboardType: TextInputType.number,
                            controller: scoreController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColors.lightBlue,
                                        width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColors.lightBlue,
                                        width: 2))),
                            validator: (value) {
                              if (value == null || value.isEmpty || int.parse(value) < 0) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: ((newValue) {
                              score = int.parse(newValue!);
                              print(newValue);
                            }),
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
                          if(_formKey.currentState?.validate() ?? false){
                            log('data: '); //Les validations log la valeur
                            _formKey.currentState?.save();
                            updateHighScore(HighScoreEntity(
                                id: widget.highScoreEntity.id,
                                username: name,
                                score: score,
                                dateTime: widget.highScoreEntity.dateTime));
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
            const Spacer()
          ]),
        )
      ]),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
