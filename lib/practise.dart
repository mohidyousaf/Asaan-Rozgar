import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:google_fonts/google_fonts.dart';


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
            username TEXT PRIMARY KEY, password TEXT
          )        
       ''');
        },
        version: 1
    );
    return dbs;
  }

  newUser(username, password) async {
    final db = await database;
    print(username + " " + password);
    var res = await db.rawInsert('''
    INSERT INTO users(
      username,password
    ) VALUES (?,?)
    ''', [username, password]);

    return res;
  }

  Future<dynamic> getUser() async{
    final db =await database;
    var res= await db.query("users");
    if(res.length==0){
      return Null;
    }else{
      var resMap= res[0];
      return resMap.isNotEmpty ? resMap :Null;
    }
  }
}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  DBprovider.db.newUser('adil', 'hello');
  runApp(MaterialApp(
      home: Home()
  ));
}



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asaan Rozgaar'),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade900,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: <Widget>[
             Expanded(
               flex: 1,
               child: Container(
                 padding: EdgeInsets.all(100),
                 color: Colors.blue[900],
                 child: Text( 
                     'Welcome Back',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                     ),
               ),
             ),
              Icon(
                Icons.airplanemode_active,
                color: Colors.cyan[80],
                size: 50,
              )
           ],
          ),
          Container(
            padding: EdgeInsets.all(100),
            color: Colors.deepOrange[900],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('click'),
        backgroundColor: Colors.cyan.shade900,
      ),
    );
  }
}