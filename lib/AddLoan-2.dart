import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: AddLoans_2()
//   ));
// }

class AddLoans_2 extends StatefulWidget {
  @override
  _AddLoans_2State createState() => _AddLoans_2State();
}

class _AddLoans_2State extends State<AddLoans_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: <Widget>[
          SizedBox(height:50),
          Center(
            child: Text(
              'Add Loan',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lato',
                  color: Colors.black87
              ),
            ),
          ),

          SizedBox(height: 30),
          Image.asset('assets/loan.png'),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              color: Colors.white,

              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      // controller: userEntry,
                      decoration: InputDecoration(
                          labelText: 'Type Of Interest',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      // controller: userEntry,
                      decoration: InputDecoration(
                          labelText: 'Repayment Mode',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      // controller: userEntry,
                      decoration: InputDecoration(
                          labelText: 'Late Fee (Optional)',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                    SizedBox(height: 10),

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
                          onPressed: () {
                            // var temp = await DBprovider.db.login(userEntry.text.toString(), passEntry.text.toString());
                            // setState(() {
                            //   response = temp;
                            // });
                          },
                          child: Center(
                            child: Text(
                                'Add Loan',
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
          )
        ],
      ),
    );
  }
}
