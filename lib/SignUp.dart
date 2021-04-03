import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'SignIn.dart';
// import 'package:asaan_rozgar/Widgets/long_circleBtt.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: signup()
  ));
}

class signup extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController FirstName = new TextEditingController();
  TextEditingController BusinessName = new TextEditingController();
  TextEditingController EmailAddress = new TextEditingController();
  TextEditingController Password = new TextEditingController();



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
                        TextField(
                          controller: FirstName,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: BusinessName,
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: EmailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: Password,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                          obscureText: true,
                        ),
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
                                  var temp = await DBprovider.db.newUser(FirstName.text.toString(), BusinessName.text.toString(),EmailAddress.text.toString(),Password.text.toString());
                                  SignIn();
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
                                  Navigator.of(context)
                                      .push(
                                    MaterialPageRoute(
                                        builder: (context)=> SignIn())
                                  );
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
          ],
        ),
      ),
    );
  }
}
