import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/validationFunctions.dart';
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

      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color:Color.fromRGBO(11, 71, 109, 1.0)),
        ),
        title: Text(
            'Add Account',
            style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Color.fromRGBO(11, 71, 109, 1.0)))),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height:50),


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
                      InputTextFields(label: 'Title', controller: Title, validateFunc: ValidationFunctions.validateEmpty),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Name', controller: Name, validateFunc: ValidationFunctions.validateEmpty),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Account Number', controller: AccountNo, validateFunc: ValidationFunctions.validateAccount),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Current Balance', controller: CurrentBal, validateFunc: ValidationFunctions.validateEmpty),
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
                                var temp = await DBprovider.db.addAccount(
                                    'AsaanRozgaar',
                                    Title.text.toString(),
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
