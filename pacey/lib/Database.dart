import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "pacey_db.db";
  static final _databaseVersion = 1;

  static final profileTable = 'Profile';
  static final runTable = 'Run';

  static final profileId = '_profile_id';
  static final profileName = 'name';
  static final profileGender = 'gender';
  static final profileAge = 'age';
  static final profileWeight = 'weight';
  static final profileHeight = 'height';

  static final runId = '_run_id';
  static final runDate = 'date';
  static final runDistance = 'distance';
  static final runDuration = 'duration';


  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory);
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {

    await db.execute('''
      CREATE TABLE $profileTable (
        $profileId INTEGER PRIMARY KEY,
        $profileName TEXT NOT NULL,
        $profileGender TEXT NOT NULL,
        $profileAge TEXT NOT NULL,
        $profileWeight TEXT NOT NULL,
        $profileHeight TEXT NOT NULL
      );
      ''');
    await db.execute('''
      CREATE TABLE $runTable (
        $runId INTEGER PRIMARY KEY,
        $runDate TEXT NOT NULL,
        $runDistance DECIMAL NOT NULL,
        $runDuration TEXT NOT NULL
      );
      ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertProfile(Map<String, dynamic> profile) async {
    Database db = await instance.database;
    return await db.insert(profileTable, profile);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<Map<String, dynamic>> getProfile() async {
    Database db = await instance.database;
    List profiles = await db.query(profileTable);
    return profiles[0];
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCountProfile() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $profileTable'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> updateProfile(Map<String, dynamic> profile) async {
    Database db = await instance.database;
    int id = profile[profileId];
    return await db.update(profileTable, profile, where: '$profileId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> deleteProfile(int id) async {
    Database db = await instance.database;
    return await db.delete(profileTable, where: '$profileId = ?', whereArgs: [id]);
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insertRun(Map<String, dynamic> run) async {
    Database db = await instance.database;
    return await db.insert(runTable, run);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRowsRun() async {
    Database db = await instance.database;
    return await db.query(runTable);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCountRun() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $runTable'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> updateRun(Map<String, dynamic> run) async {
    Database db = await instance.database;
    int id = run[runId];
    return await db.update(runTable, run, where: '$runId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> deleteRun(int id) async {
    Database db = await instance.database;
    return await db.delete(runTable, where: '$runId = ?', whereArgs: [id]);
  }

  Future<String> getTotalDistanceRun() async {
    Database db = await instance.database;
    if (await this.queryRowCountRun()>0){
      var result = await db.rawQuery('SELECT SUM($runDistance) FROM $runTable');
      print('result:' + result.toString());
      return result[0]['SUM($runDistance)'].toString();
    }else{
      return '0.00';
    }
  }
}