import 'package:flutter/material.dart';
import 'package:whack_a_mole/Widgets/menu_button.dart';
import 'package:whack_a_mole/theme_colors.dart';

class ScoreValitatorForm extends StatefulWidget {
  const ScoreValitatorForm({super.key});

  @override
  State<ScoreValitatorForm> createState() => _ScoreValitatorFormState();
}

class _ScoreValitatorFormState extends State<ScoreValitatorForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                            borderSide:
                                BorderSide(color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ThemeColors.lightBlue, width: 2))),
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
                            borderSide:
                                BorderSide(color: ThemeColors.lightBlue, width: 2))),
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
                            borderSide:
                                BorderSide(color: ThemeColors.lightBlue, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ThemeColors.lightBlue, width: 2))),
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
                  // Fonction de validation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
