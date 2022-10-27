import "package:flutter/material.dart";
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Widgets/high_score_list_item.dart';
import 'package:whack_a_mole/services/highScore.service.dart';

class HighScoreList extends StatefulWidget {
  //Liste de scores temporaire
  List<HighScoreEntity> highScores = [];
  HighScoreList({
    Key? key,
  }) : super(key: key);

  @override
  State<HighScoreList> createState() => _HighScoreListState();
}

class _HighScoreListState extends State<HighScoreList> {

  @override
  void initState() {
    super.initState();

    //fetch highscores from database
    getAllHighScore().then((value) {
      setState(() {
        widget.highScores = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.highScores.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            //Couleur alterne entre gris foncé et pâle
            child: HighScoreListItem(
                highScore: widget.highScores[i],
                color: i % 2 == 0
                    ? const Color(0xFF333333)
                    : const Color(0xFF666666)),
          );
        });
  }
}
