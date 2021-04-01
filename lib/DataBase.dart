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
    _database= await this.initDB();
    print('returned');
    return _database;
  }

  initDB() async{
    print(await getDatabasesPath());
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
        where: 'username = ?;',
        whereArgs: [username]);

    if (users[0]['password'] == password)
    {
      return "correct password";
    }
    else
    {
      return 'incorrect password';
    }
  }
  newUser(username, businessName, emailAddress, password) async {
    final db = await database;
    print(username + " " + password);
    var res = await db.rawInsert('''
    INSERT INTO users(
      username,BusinessName,EmailAddress,password
    ) VALUES (?,?,?,?)
    ''', [username,businessName,emailAddress, password]);

    return res;
  }

  getUser() async{
    final db =await database;
    // final List<Map<String, dynamic>> maps = await db.query("users");


    // final List<Map<String, dynamic>> maps = await db.rawQuery('''
    //     SELECT * FROM users WHERE username=?;
    //   ''', ['mohid']);

    final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'username = ?',
        whereArgs: ['mohid']
    );
    return maps;

  }
}