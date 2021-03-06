import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: AddCompany()
//   ));
// }

class AddCompany extends StatefulWidget {
  @override
  _AddAccountsState createState() => _AddAccountsState();
}

class _AddAccountsState extends State<AddCompany> {
  TextEditingController CompanyName = new TextEditingController();
  TextEditingController CompanyDescription = new TextEditingController();
  TextEditingController TotalPayable = new TextEditingController();
  TextEditingController TotalReceivable = new TextEditingController();
  TextEditingController EmailAddress = new TextEditingController();
  TextEditingController CompanyNo = new TextEditingController();
  Map data={};
  String name;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setState(() {
      name = data['name'];
    });


    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color:Color.fromRGBO(11, 71, 109, 1.0)),
        ),
        title: Text(
            'Add Company',
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
                      InputTextFields(label: 'Company Name', controller: CompanyName,),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Company Description', controller: CompanyDescription),
                      SizedBox(height: 10),
                      // InputTextFields(label: 'Total Payable', controller: TotalPayable),
                      // SizedBox(height: 10),
                      // InputTextFields(label: 'Total Receivable', controller: TotalReceivable),
                      // SizedBox(height: 10),
                      InputTextFields(label: 'Email Address', controller: EmailAddress),
                      SizedBox(height: 10),
                      InputTextFields(label: 'Company No.', controller: CompanyNo),
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
                                var temp = await DBprovider.db.addCompany(
                                    name,
                                    CompanyName.text.toString(),
                                    CompanyDescription.text.toString(),
                                    0,
                                    0,
                                    // TotalPayable.text.toString(),
                                    // TotalReceivable.text.toString(),
                                    EmailAddress.text.toString(),
                                    CompanyNo.text.toString());
                                var temp2 = await DBprovider.db.addAccount(
                                    CompanyName.text.toString(),
                                    "Default",
                                    "Cash",
                                    "None",
                                    0);

                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setString('companyName', CompanyName.text.toString());
                                prefs.setString('companyAddress', EmailAddress.text.toString());
                                Navigator.pushNamed(context, '/check', arguments: {
                                  'companyName': CompanyName.text.toString()
                                });
                            },
                            child: Center(
                              child: Text(
                                  'Add Company',
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
