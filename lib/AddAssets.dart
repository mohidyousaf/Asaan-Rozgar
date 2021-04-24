import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DataBase.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';


class AddAssets extends StatefulWidget {
  @override
  _AddAssetsState createState() => _AddAssetsState();
}

class _AddAssetsState extends State<AddAssets> {
  TextEditingController Description = new TextEditingController();
  TextEditingController Name = new TextEditingController();
  TextEditingController Type = new TextEditingController();
  TextEditingController Value = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        elevation: 0,
        backgroundColor:Color.fromRGBO(11, 71, 109, 1.0),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Add Assets',
          style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 26.0,color: Colors.white)),
        ),
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height:50),
          SizedBox(height: 30),
          Image.asset('assets/asset.png'),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              color: Colors.white,

              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InputTextFields(label: 'Name',controller: Name),
                    SizedBox(height: 10),
                    InputTextFields(label:'Description', controller: Description),
                    SizedBox(height: 10),
                    InputTextFields(label: 'Type', controller: Type),
                    SizedBox(height: 10),
                    InputTextFields(label:'Value', controller: Value),
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
                            var temp = await DBprovider.db.addAssets(Name.text.toString(), Description.text.toString(), Type.text.toString(), Value.text.toString());
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                            print(temp);
                            },
                          child: Center(
                            child: Text(
                                'Add Asset',
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
