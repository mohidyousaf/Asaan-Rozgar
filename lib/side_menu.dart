import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/main.dart';
import 'package:asaanrozgar/Widgets/buttons.dart';
import 'package:asaanrozgar/Widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Add_Item.dart';
// import './Expenses.dart';
import './AddEquity.dart';
import './AddAccount.dart';
import './AddAssets.dart';
import './Parties.dart';

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
  // String selectedValue;
  // List listItem = [
  //   "Item 1", "Item 2", "Item 3"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title: Text('hi'),
      ),
      endDrawer: 
      Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
              accountName: Text("Ali Store",
              style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
              accountEmail: Text("ali@gmail.com",
              style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                 // color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                      radius: 60.0,
                      backgroundColor:  Colors.orange,
                      child: Image.asset(
                       'assets/photo.png',
                      ), //For Image Asset

                    ),
               // image:AssetImage('assets/photo.png'),
              
              ),

// Transaction
              ListTile(
                leading: Image.asset('assets/user2.png'),
                title: Text("Transaction",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddItem()
                      )
                   );
                },
              ),

// Expenses
               ListTile(
                leading: Image.asset('assets/Vector.png'),
                title: Text("Expenses",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => null,
                      )
                   );
                },
              ),
// Parties
               ListTile(
                leading: Image.asset('assets/person.png'),
                title: Text("Parties",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => Parties()
                      )
                   );
                },
              ),

// Add Info
               ListTile(
                leading: Image.asset('assets/Plus.png'),
                title: Text("Add Assets",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddAssets()
                      )
                   );
                },
              ),

              ListTile(
                leading: Image.asset('assets/Plus.png'),
                title: Text("Add Liabilities",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => null,
                      )
                   );
                },
              ),

              ListTile(
                leading: Image.asset('assets/Plus.png'),
                title: Text("Add Account",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddAccounts()
                      )
                   );
                },
              ),

              ListTile(
                leading: Image.asset('assets/Plus.png'),
                title: Text("Add Equity",
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddEquities()
                      )
                   );
                },
              ),

    //Dropdown... fix later
      // DropdownButton(
      //   value: selectedValue,
      //   onChanged: (newVal) {
      //     setState(() {
      //       selectedValue = newVal;
      //     });
      //   },
      //     items: listItem.map((value) { return DropdownMenuItem(
      //         value: value,
      //         child: Text(value),
      //     );}
      // ).toList(),

      // ),
          ]
          ),
      ),

    );
  }
}
