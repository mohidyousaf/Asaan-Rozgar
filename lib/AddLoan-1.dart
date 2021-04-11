import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: AddLoans()
//   ));
// }

class AddLoans extends StatefulWidget {
  @override
  _AddLoansState createState() => _AddLoansState();
}

class _AddLoansState extends State<AddLoans> {
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
          'Add Loans',
          style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Color.fromRGBO(11, 71, 109, 1.0)))),
        ),

      body: Column(
        children: <Widget>[
          // SizedBox(height:50),

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
                          labelText: 'Party',
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
                          labelText: 'Amount',
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
                          labelText: 'TimePeriod',
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
                          labelText: 'InterestRate',
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
                          onPressed: () {
                            // var temp = await DBprovider.db.login(userEntry.text.toString(), passEntry.text.toString());
                            // setState(() {
                            //   response = temp;
                            // });
                            Navigator.pushNamed(context, '/addLoan2');
                          },
                          child: Center(
                            child: Text(
                                'Next',
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
