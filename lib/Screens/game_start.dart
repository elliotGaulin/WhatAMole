import "package:flutter/material.dart";
import 'package:whack_a_mole/Style/theme_colors.dart';
import '../Widgets/animated_circle_button.dart';
import '../Widgets/background.dart';

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
              AnimatedCircleButton(size: Size.square(50), color: ThemeColors.lightBlue, action: () {
                debugPrint("Game not developped yet");
                Navigator.of(context).pop();
              },),
              const Text("TAP THE", style: TextStyle(color: Colors.white, fontSize: 18),),
              const Text("CIRCLE TO START", style: TextStyle(color: Colors.white, fontSize: 18),),
              const Spacer(),
            ]),
          )
        ],
      ),
      backgroundColor: ThemeColors.backgroudBlue,
    );
  }
}
