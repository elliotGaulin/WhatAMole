import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Screens/Modify_Score.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';
import 'package:whack_a_mole/services/highScore.service.dart';

class HighScoreListItem extends StatefulWidget {
  final HighScoreEntity highScore;
  final Color color;

  const HighScoreListItem({
    required this.highScore,
    this.color = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  State<HighScoreListItem> createState() => _HighScoreListItemState();
}

class _HighScoreListItemState extends State<HighScoreListItem> {
  static const Color hoverColor = ThemeColors.lightBlue;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      color: isHover ? hoverColor : widget.color,
      child: Row(children: [
        Expanded(
          flex: 4,
          child: Text(
            DateFormat("yyyy-MM-dd").format(widget.highScore.dateTime),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.highScore.username.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
        Text(
          widget.highScore.score.toString(),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
        ),
        IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ModifyScore(
                    highScoreEntity: widget.highScore,
                  ))),
          icon: const Icon(Icons.edit),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Supprimer le score"),
                  content: const Text("Voulez-vous supprimer le score?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Annuler")),
                    TextButton(
                        onPressed: () {
                          if (widget.highScore.id != null) {
                            print("T");
                            deleteHighScore(widget.highScore.id!);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          }
                        },
                        child: const Text("Supprimer"))
                  ],
                );
              }),
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      ]),
    );
  }
}
