import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/validationFunctions.dart';
import 'package:asaanrozgar/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  initFunc() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('companyName');

    });
  }
  SharedPreferences prefs;
  Map data={};
  String name;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (data == null){
      initFunc();
    }
    else{
      setState(() {
        name = data['companyName'];
      });
    }

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
                      InputTextFields(label: 'Account Type', controller: Title, validateFunc: ValidationFunctions.validateEmpty),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Bank Name', controller: Name, validateFunc: ValidationFunctions.validateEmpty),
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
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                var loggedIn= prefs.getString('loggedIn');
                                var temp = await DBprovider.db.addAccount(
                                    name,
                                    Title.text.toString(),
                                    Name.text.toString(),
                                    AccountNo.text.toString(),
                                    CurrentBal.text.toString());

                                int check = prefs.getInt('accountCheck');

                                if (check == null){
                                  var temp2 = await DBprovider.db.addEquity("Owner's Equity" , CurrentBal.text.toString(), name, 0);
                                }
                                else{
                                  var temp2 = await DBprovider.db.addEquity("Owner's Equity" , CurrentBal.text.toString(), name, 1);
                                }




                                loggedIn == null ? Navigator.of(context).pushNamedAndRemoveUntil('/signIn', (Route<dynamic> route) => false):
                                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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
