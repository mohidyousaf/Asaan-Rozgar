import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'DataBase.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: AddEquities()
//   ));
// }

class AddEquities extends StatefulWidget {
  @override
  _AddEquitiesState createState() => _AddEquitiesState();
}

class _AddEquitiesState extends State<AddEquities> {
  @override
  TextEditingController Name = new TextEditingController();
  TextEditingController Amount = new TextEditingController();
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
            'Add Equity',
            style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Color.fromRGBO(11, 71, 109, 1.0)))),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height:50),


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
                    InputTextFields(label: 'Type',controller: Name),
                    SizedBox(height: 10),
                    InputTextFields(label: 'Amount', controller: Amount),
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
                            var temp = await DBprovider.db.addEquity(Name.text.toString(), Amount.text.toString());
                            print(temp);
                            },
                          child: Center(
                            child: Text(
                                'Add Equity',
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
