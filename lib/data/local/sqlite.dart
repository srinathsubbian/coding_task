import 'package:coding_task/data/model/favourites_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "events_list.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.rawQuery(
        "CREATE TABLE IF NOT EXISTS favourite(id INTEGER PRIMARY KEY AUTOINCREMENT,title VARCHAR(150) NOT NULL,event_id INTEGER NOT NULL,location VARCHAR(50),event_time VARCHAR(100),photo VARCHAR(300))");
    debugPrint("Created tables");
  }

  Future<int> addFavourite(FavouritesModel favourite) async {
    var dbClient = await db;
    Map<String, String> values = {};
    values.putIfAbsent('title', () => favourite.title!);
    values.putIfAbsent('event_id', () => favourite.eventId!);
    values.putIfAbsent('location', () => favourite.location!);
    values.putIfAbsent('event_time', () => favourite.eventTime!);
    values.putIfAbsent('photo', () => favourite.photo!);
    return await dbClient!.insert('favourite', values);
  }

  Future<int> deleteExpense(FavouritesModel favourite) async {
    var dbClient = await db;
    return await dbClient!.delete('favourite',
        where: "event_id = ?", whereArgs: [favourite.eventId]);
  }

  Future<List<FavouritesModel>> getFavourites() async {
    List<FavouritesModel> favourites = [];
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM favourite');
    for (Map income in list) {
      favourites.add(FavouritesModel(
          id: income['id'],
          title: income['title'],
          eventId: income['event_id'].toString(),
          eventTime: income['event_time'],
          location: income['location'],
          photo: income['photo']));
    }
    return favourites;
  }
}
