import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:whack_a_mole/Objects/high_score_entity.dart';
import 'package:whack_a_mole/services/sqlite.service.dart';

//insert
//https://docs.flutter.dev/cookbook/persistence/sqlite

Future<bool> inserthighScore(HighScoreEntity highScore) async {
  final db = await SqliteService.database;

  await db.insert(
    'highscore',
    highScore.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return true;
}

//select
Future<List<HighScoreEntity>> getAllHighScore() async {
  final db = await SqliteService.database;

  final List<Map<String, dynamic>> maps = await db.query('highscore');
  return List.generate(maps.length, (i) {
    return HighScoreEntity.fromMap(maps[i]);
  });
}


//delete


//update



