import 'package:flutter/material.dart';
import 'DataBase.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  // List<Map<String, dynamic>> users = DBprovider.db.getUser();

  runApp(MaterialApp(
      home: Home()
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String response = "";
  TextEditingController userEntry = new TextEditingController();
  TextEditingController passEntry = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asaan Rozgaar'),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade900,
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            TextField(
              controller: userEntry,
              textAlign: TextAlign.left,
              style:TextStyle(
                fontSize: 40,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'username',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextField(
              controller: passEntry,
              obscureText: true,
              textAlign: TextAlign.left,
              style:TextStyle(
                fontSize: 40,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Text(response,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey[600],

              ),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          var temp = await DBprovider.db.login(userEntry.text.toString(), passEntry.text.toString());
          setState(() {
            response = temp;
          });


        },
        backgroundColor: Colors.cyan.shade900,
      ),
    );
  }
}

