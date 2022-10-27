import "package:flutter/material.dart";
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/Screens/high_score.dart';
import 'package:whack_a_mole/Widgets/high_score_list_item.dart';
import 'package:whack_a_mole/services/highScore.service.dart';


class ListTileSelectExample extends StatefulWidget {
  ListTileSelectExample({super.key});
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
  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 30;
  late List<bool> _selected;
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    initializeSelection();
    getAllHighScore().then((value) {
      setState(() {
        widget.highScores = value;
      });
    });
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor:Colors.white,
          title: const Text(
            'SELECT THE SCORE(S)', style: TextStyle(fontSize: 17),
          ),
          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      isSelectionMode = false;
                    });
                    initializeSelection();
                  },
                )
              : const SizedBox(),
          actions: <Widget>[
            if (isSelectionMode)
              TextButton(
                  child: !_selectAll
                      ? const Text(
                          'select all',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'unselect all',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    _selectAll = !_selectAll;
                    setState(() {
                      _selected =
                          List<bool>.generate(listLength, (_) => _selectAll);
                    });
                  }),
          ],
        ),
        body: ListBuilder(
                highscore: widget.highScores,
                isSelectionMode: isSelectionMode,
                selectedList: _selected,
                onSelectionChange: (bool x) {
                  setState(() {
                    isSelectionMode = x;
                  });
                },
              ));
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.highscore,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });
  final List<HighScoreEntity> highscore;
  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.highscore.length,
        itemBuilder: (BuildContext context, int i){
          return ListTile(
              onTap: () => {_toggle(i),                 
              if (!widget.isSelectionMode) {
                  setState(() {
                    widget.selectedList[i] = true;
                  })},
                  widget.onSelectionChange!(true)
                },
              trailing: widget.isSelectionMode
                  ? Checkbox(
                      value: widget.selectedList[i],
                      onChanged: (bool? x) => _toggle(i),
                    )
                  : const SizedBox.shrink(),
              title: Text('${widget.highscore[i].dateTime}     ${widget.highscore[i].username}     ${widget.highscore[i].score}', style: const TextStyle(color: Colors.white),),);
        }
        );
  }
}

