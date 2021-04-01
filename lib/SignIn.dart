
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: SignIn()
  ));
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String response = "";
  TextEditingController userEntry = new TextEditingController();
  TextEditingController passEntry = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(11, 71, 109, 1.0),
      body: Column(
        children: <Widget> [
          SizedBox(height: 40),
          Text(
              'Welcome Back',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'lato',
            ),
          ),
          SizedBox(height: 30),
          Image.asset('assets/bro.png'),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              // color: Colors.white,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      ),
                  color: Colors.white),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget> [
                    TextField(
                      controller: userEntry,
                      decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                    SizedBox(height:30),
                    TextField(
                      controller: passEntry,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
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
                          onPressed: () async{
                            var temp = await DBprovider.db.login(userEntry.text.toString(), passEntry.text.toString());
                            setState(() {
                              response = temp;
                            });
                          },
                          child: Center(
                            child: Text(
                                'Login',
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
                    SizedBox(height: 30),
                    Text(response,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.grey[600],
                        fontFamily: 'lato'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
