import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whack_a_mole/Objects/high_score.dart';
import 'package:whack_a_mole/Screens/high_score.dart';

//insert
//https://docs.flutter.dev/cookbook/persistence/sqlite

Future<bool> insertDog(HighScoreEntity highScore, Database database) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'dogs',
    highScore.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return true;
}

//select



//delete


//update



