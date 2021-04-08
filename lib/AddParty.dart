import 'package:asaanrozgar/Widgets/validationFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';

class AddParty extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AddPartyState createState() => _AddPartyState();
}
class _AddPartyState extends State<AddParty> {
  TextEditingController partyType = new TextEditingController();
  TextEditingController partyName = new TextEditingController();
  TextEditingController partyDescription = new TextEditingController();
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController contactNo = new TextEditingController();
  TextEditingController accountNo = new TextEditingController();
  TextEditingController payable = new TextEditingController();
  TextEditingController receivable = new TextEditingController();



  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValid = AutovalidateMode.disabled;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),

      home: Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),

        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
              height: 250,
              width: 420,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(11, 71, 109, 1.0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(20.0, -20.0),
                      bottomRight: Radius.circular(0)
                  )
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Add Party',
                    style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Colors.white)),
                  ),
                  Image.asset('assets/Frame 7.png')
                ],
              ),
            ),
            Expanded(
              child: Form(
                autovalidateMode: autoValid,
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  //height: 547.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                          InputTextFields(label: 'Party Type', controller:partyType,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Party Name', controller:partyName,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Party Description', controller:partyDescription,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Email Address', controller:emailAddress,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Contact No', controller:contactNo,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Account No', controller:accountNo,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Payables', controller:payable,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Receivables', controller:receivable,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 50.0),

                          Container(
                              height: 40.0,
                              width: 200.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.grey[900],
                                color: Color.fromRGBO(11, 71, 109, 1.0),
                                elevation: 7.0,
                                child: TextButton(
                                  onPressed: () async{
                                    if (_formKey.currentState.validate()) {
                                      var temp = await DBprovider.db.addParty(
                                          partyType.text.toString(),
                                          partyName.text.toString(),
                                          partyDescription.text.toString(),
                                          emailAddress.text.toString(),
                                          contactNo.text.toString(),
                                          accountNo.text.toString(),
                                          payable.text.toString(),
                                          receivable.text.toString());
                                    print(temp);
                                    Navigator.pushReplacementNamed(context, '/home');
                                    }
                                    else{
                                      setState((){
                                        autoValid = AutovalidateMode.always;
                                      });
                                      print('yoooooooooooo');
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'Add Party',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 50.0),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
