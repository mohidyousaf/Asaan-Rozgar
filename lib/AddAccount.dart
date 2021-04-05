import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: AddAssets()
  ));
}

class AddAssets extends StatefulWidget {
  @override
  _AddAssetsState createState() => _AddAssetsState();
}

class _AddAssetsState extends State<AddAssets> {
  TextEditingController Title = new TextEditingController();
  TextEditingController Name = new TextEditingController();
  TextEditingController AccountNo = new TextEditingController();
  TextEditingController CurrentBal = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: <Widget>[
          SizedBox(height:50),
          Center(
            child: Text(
              'Add Account',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lato',
                  color: Colors.black87
              ),
            ),
          ),

          SizedBox(height: 30),
          Image.asset('assets/Frame 8.png'),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              color: Colors.white,

              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: Title,
                      decoration: InputDecoration(
                          labelText: 'Title',
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
                      controller: Name,
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
                    SizedBox(height: 10),
                    TextField(
                      controller: AccountNo,
                      decoration: InputDecoration(
                          labelText: 'Account Number',
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
                      controller: CurrentBal,
                      decoration: InputDecoration(
                          labelText: 'Current Balance',
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
                            var temp = await DBprovider.db.addAccount(Title.text.toString(), Name.text.toString(), AccountNo.text.toString(),CurrentBal.text.toString());
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
          )
        ],
      ),
    );
  }
}
