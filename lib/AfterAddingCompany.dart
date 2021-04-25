import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/main.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: Check()
//   ));
// }

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  TextEditingController CompanyName = new TextEditingController();
  TextEditingController CompanyDescription = new TextEditingController();
  TextEditingController TotalPayable = new TextEditingController();
  TextEditingController TotalReceivable = new TextEditingController();
  TextEditingController EmailAddress = new TextEditingController();
  TextEditingController CompanyNo = new TextEditingController();
  String name;
  Map data={};
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['companyName'];
    });
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
            'Add Details',
            style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Color.fromRGBO(11, 71, 109, 1.0)))),
      ),
      body: Column(
        children: <Widget>[

          SizedBox(height: 30),
          Center(child: Image.asset('assets/Frame 8.png')),
          SizedBox(height: 60),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              // color: Colors.white,

              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget>[

                      Container(
                        height: 40.0,
                        width: 200.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.grey[900],
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: ()  {
                              Navigator.pushNamed(context,'/addAccount',arguments: {
                                'companyName': name
                              });
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
                      SizedBox(height: 30),
                      Container(
                        height: 40.0,
                        width: 200.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.grey[900],
                          color: Color.fromRGBO(11, 71, 109, 1.0),
                          elevation: 7.0,
                          child: TextButton(
                            onPressed: ()  async{
                              Navigator.pushNamed(context,'/balance',arguments: {
                                'companyName':name
                              });
                            },
                            child: Center(
                              child: Text(
                                  'Skip',
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
