import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'DataBase.dart';


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: AddEquities()
  ));
}

class AddEquities extends StatefulWidget {
  @override
  _AddEquitiesState createState() => _AddEquitiesState();
}

class _AddEquitiesState extends State<AddEquities> {
  @override
  TextEditingController Name = new TextEditingController();
  TextEditingController Amount = new TextEditingController();
      String selected_drop;
  var asset_type=['Owner\'s Equity','Shareholders\' Equity',];
  @override
  void initState(){
    super.initState();
    selected_drop=asset_type[0];

  }
  void select_dropdown(String val){
    setState(() {
      selected_drop=val;
    });
  }
  Widget build(BuildContext context) {
    double phone_width=MediaQuery.of(context).size.width;
    double phone_height=MediaQuery.of(context).size.height;
    double box_width=phone_width*0.899;
    double box_height=phone_height*0.0527;
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                         'Type',
                         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,fontSize: 16.0,)),
                       ),
                       SizedBox(height: 5.0),
                DropdownButtonHideUnderline(
                                              child: Container(
                                                width: box_width,
                                                height: box_height,
                                                decoration: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(style: BorderStyle.solid),
                                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    ) 
                                                  ),
                           child: DropdownButton<String>(
                             value: selected_drop,
                             icon: const Icon(Icons.arrow_drop_down),
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                             hint: Text(
                               ' Select Type of Equity',
                               style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                             ),
                              items: asset_type.map((String dropDownStringItem){
                               return DropdownMenuItem<String>(
                                 value: dropDownStringItem,
                                 child: Text(dropDownStringItem),
                                );
                             }).toList(),
                             onChanged: (String value){
                               select_dropdown(value);
                             },
                           ),
                         ),
                       ),
                            ],
                          ),
                    SizedBox(height: 20),
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
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
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
