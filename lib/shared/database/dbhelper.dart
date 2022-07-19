import 'package:sqflite/sqflite.dart';

class DbHelper{
   static Future<Database> init(){
     return openDatabase(
        'tasks.db',
        version: 1,
        onCreate: (Database database, int version) async {
          await createTables(database);
          print('Database was created succesfully');
        },
      );
  }

   static Future<void> createTables(Database database) async {
     await database.execute("""CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        progress DOUBLE,
        status INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        lastUpdated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
   }
}