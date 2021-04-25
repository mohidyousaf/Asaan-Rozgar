import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './DataBase.dart';
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
import 'package:asaanrozgar/Transactions.dart';
import 'package:asaanrozgar/AddLoan-1.dart';
import 'package:asaanrozgar/AddParty.dart';
import 'package:asaanrozgar/Add_Expenses1.dart';
import 'package:asaanrozgar/Add_Expenses2.dart';
import 'package:asaanrozgar/Parties_home.dart';


class drawer extends StatefulWidget {
  drawer({this.companyName});
  final companyName;

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  var companyName = "";
  double companyBalance;
  String companyAddress;
  getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      companyName = prefs.getString('companyName');
      companyAddress = prefs.getString('companyAddress');
    });
  }

  getBalance()async{

    List<Map<String, dynamic>> temp = await DBprovider.db.getBalance(accountName: 'Standard Chartered');
    temp.forEach((element) {
      setState(() {
        print(element['Balance']);
        companyBalance = element['Balance'];
      });
    });
  }


  @override
  initState(){
    super.initState();
    Future.delayed(Duration.zero, () {
      getName();
      getBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),
              accountName: Text(companyName == null ? '': companyName,
              style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
                ),
              accountEmail: Text(companyAddress == null ? '': companyAddress,
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

            ListTile(
              leading: Text('Balance',
              style: TextStyle(
                fontFamily: 'lato',
                fontSize: 22,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(11, 71, 109, 1.0),
              ),

              ),
              title: Text('${companyBalance.toString()}',
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: companyBalance == null ? Colors.green[800]:companyBalance < 0 ? Colors.red[800]:Colors.green[800],
                ),
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => transactions()
                    )
                );
              },
            ),


// Transaction

              ListTile(
                leading: Image.asset('assets/user2.png'),
                title: Text("Transactions",
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
                      builder: (BuildContext context) => transactions()
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
                      builder: (BuildContext context) => partiesHome()
                      )
                   );
                },
              ),

            ListTile(
              leading: Image.asset('assets/Plus.png'),
              title: Text("Add Expenses",
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
                      builder: (BuildContext context) => add_expenses2(),
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
                      builder: (BuildContext context) => AddLoans(),
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
//Sign Out
               ListTile(
                leading: Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                    child: Icon(Icons.logout, size: 28,color: Color.fromRGBO(11, 71, 109, 1.0,))),
                title: Text(
                'Sign out',
                style: TextStyle(
                  fontFamily: 'lato',
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                ),
              ),
                onTap: ()
                 async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('loggedIn');
                Navigator.pushReplacementNamed(context, '/signIn');
                 },

                      )
          ]),
                   );






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


  }
}