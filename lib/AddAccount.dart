import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/main.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: AddAccounts()
//   ));
// }

class AddAccounts extends StatefulWidget {
  @override
  _AddAccountsState createState() => _AddAccountsState();
}

class _AddAccountsState extends State<AddAccounts> {
  TextEditingController Title = new TextEditingController();
  TextEditingController Name = new TextEditingController();
  TextEditingController AccountNo = new TextEditingController();
  TextEditingController CurrentBal = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: <Widget>[
          SizedBox(height:50),
          Center(
            child: Text(
              'Add Account',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lato',
                  color: Colors.black87
              ),
            ),
          ),

          SizedBox(height: 30),
          Image.asset('assets/Frame 8.png'),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              color: Colors.white,

              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget>[
                      InputTextFields(label: 'Title', controller: Title,),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Name', controller: Name),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Account Number', controller: AccountNo),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Current Balance', controller: CurrentBal),
                      SizedBox(height: 40),
                      Container(
                        height: 40.0,
                        width: 200.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.grey[900],
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                var temp = await DBprovider.db.addAccount(Title
                                    .text.toString(),
                                    Name.text.toString(),
                                    AccountNo.text.toString(),
                                    CurrentBal.text.toString());
                                Navigator.pushNamed(context, '/home');
                              }
                            },
                            child: Center(
                              child: Text(
                                  'Add Account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'lato'
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
