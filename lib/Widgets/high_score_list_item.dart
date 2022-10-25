import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:whack_a_mole/Objects/high_score.dart';
import 'package:whack_a_mole/Style/theme_colors.dart';

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
            DateFormat("yyyy-MM-dd, HH:mm:ss")
                .format(widget.highScore.dateTime),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            widget.highScore.username.toString(),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
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
      ]),
    );
  }
}
