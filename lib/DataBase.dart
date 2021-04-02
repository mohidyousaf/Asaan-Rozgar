import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DBprovider{
  DBprovider._();
  static final DBprovider db= DBprovider._();
  static Database _database;

  Future<Database> get database async{
    if(_database!= null){
      return _database;
    }
    else
    {
      _database= await this.initDB(delete: true);
      print('returned');
      return _database;
    }

  }

  initDB({delete: false}) async{
    print(await getDatabasesPath());
    if (delete) {
      await deleteDatabase(join(await getDatabasesPath(), 'AssanRozgaar.db'));
    }
    Database dbs = await openDatabase(join(await getDatabasesPath(), 'AssanRozgaar.db'),            //join method comes from path package
        onCreate: (db,version) async { await db.execute('''
          CREATE TABLE users(
            username TEXT PRIMARY KEY,BusinessName Text, EmailAddress TEXT, password TEXT
          )        
       ''');
        },
        version: 1
    );
    return dbs;
  }
  login(username, password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
        'users',
        where: 'Username = ?;',
        whereArgs: [username]);

    if (users[0]['Password'] == password)
    {
      return "correct password";
    }
    else
    {
      return 'incorrect password';
    }
  }
  newUser(username, name, emailAddress, password) async {
    final db = await database;
    print(username + " " + password);
    var res = await db.rawInsert('''
    INSERT INTO users(
      Username,Name,EmailAddress,Password
    ) VALUES (?,?,?,?)
    ''', [username, name, emailAddress, password]);

    return res;
  }

  getUser({String username}) async{
    final db =await database;
    // final List<Map<String, dynamic>> maps = await db.query("users");


    // final List<Map<String, dynamic>> maps = await db.rawQuery('''
    //     SELECT * FROM users WHERE username=?;
    //   ''', ['mohid']);

    final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'Username = ?',
        whereArgs: [username]
    );
    return maps;

  }
}