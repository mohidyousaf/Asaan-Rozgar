import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/main.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:asaanrozgar/Widgets/text.dart';



void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: Menu()
  ));
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          IconButton(
            alignment: Alignment.centerLeft,
            onPressed: (){
            },
            icon: Icon(Icons.arrow_back),

          ),


          SizedBox(height: 0),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/photo.png'),
              radius: 40.0,
            ),
          ),

          SizedBox(height: 20),
          Center(child: Text_temp('Adil Enterprise')),

          SizedBox(height: 20),
          // long_circleBtt('Company Details'),

          SizedBox(height: 40),

          RaisedButton.icon(
              onPressed: (){
              },
              icon: new Image.asset('assets/user2.png'),
              label: Text(
              'Transaction',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 22,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
              color: Colors.white,
          ),

          SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/Vector.png'),
            label: Text(
              'Expenses',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 22,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),

          SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/person.png'),
            label: Text(
              'Parties',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 22,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),

          SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/Plus.png',height: 12),
            label: Text(
              'Add Assets',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),

          SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/Plus.png',height: 12),
            label: Text(
              'Add Liabilities',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/Plus.png',height: 12),
            label: Text(
              'Add Account',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),SizedBox(height: 20),

          RaisedButton.icon(
            onPressed: (){
            },
            icon: new Image.asset('assets/Plus.png',height: 12),
            label: Text(
              'Add Equity',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),

    );
  }
}
