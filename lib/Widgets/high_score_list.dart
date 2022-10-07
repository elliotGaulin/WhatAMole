import "package:flutter/material.dart";
import 'package:whack_a_mole/Objects/high_score.dart';
import 'package:whack_a_mole/Widgets/high_score_list_item.dart';

class HighScoreList extends StatelessWidget {

  //Liste de scores temporaire
  static List<HighScore> highScores = [
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Dereck Lamothe LachanceLachanceLachanceLachanceLachanceLachanceLachance", //Test overflow
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "ElliotGaulin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "John Drouin",
        score: 12),
    HighScore(
        dateTime: DateTime.utc(2022, 04, 14, 14, 12, 3),
        username: "Bob bobo",
        score: 12),
    
  ];

  const HighScoreList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: highScores.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:2.0),
            //Couleur alterne entre gris foncé et pâle
            child: HighScoreListItem(highScore: highScores[i], color: i % 2 == 0 ? const Color(0xFF333333) : const Color(0xFF666666)),
          );
        });
  }
}
