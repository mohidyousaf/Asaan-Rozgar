import 'package:asaanrozgar/Widgets/validationFunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'SignIn.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//
//       home: SignUp()
//   ));
// }

class SignUp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<SignUp> {
  TextEditingController FirstName = new TextEditingController();
  TextEditingController BusinessName = new TextEditingController();
  TextEditingController EmailAddress = new TextEditingController();
  TextEditingController Password = new TextEditingController();

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
                    'Create Account',
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
                          InputTextFields(label: 'Username', controller:FirstName,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Name', controller:BusinessName,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Email Address', controller:EmailAddress,
                              validateFunc: ValidationFunctions.validateEmpty),
                          SizedBox(height: 20.0),
                          InputTextFields(label: 'Password', controller:Password,
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
                                      var temp = await DBprovider.db.newUser(
                                          FirstName.text.toString(), BusinessName.text.toString(),
                                          EmailAddress.text.toString(), Password.text.toString());
                                      Navigator.pushReplacementNamed(context, '/signIn');
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
                                      'Let\'s Get Started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 20.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signIn');
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.blue[900]),
                                  ),
                                )
                              ],
                            ),
                          ),
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
