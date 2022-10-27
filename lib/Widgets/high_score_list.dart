import "package:flutter/material.dart";
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Widgets/high_score_list_item.dart';
import 'package:whack_a_mole/services/highScore.service.dart';

class HighScoreList extends StatefulWidget {
  //Liste de scores temporaire
  List<HighScoreEntity> highScores = [
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12,
        id: 1),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12,
        id: 2),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12,
        id: 3),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username:
            "Dereck Lamothe LachanceLachanceLachanceLachanceLachanceLachanceLachance", //Test overflow
        score: 12,
        id: 4),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12,
        id: 5),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12,
        id: 6),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12,
        id: 7),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12,
        id: 8),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12,
        id: 9),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12,
        id: 10),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12,
        id: 11),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12,
        id: 12),
    HighScoreEntity(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12,
        id: 13),
  ];

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
