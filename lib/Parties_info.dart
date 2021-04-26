import 'package:asaanrozgar/Widgets/action_sheet.dart';
import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:asaanrozgar/Widgets/table_head.dart';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:asaanrozgar/DataBase.dart';


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
        accentColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: parties_info()
  ));
}

class parties_info extends StatefulWidget {

  @override
  _parties_infoState createState() => _parties_infoState();
}

class _parties_infoState extends State<parties_info> {
  Map data ;
  String name;
  var temp;
  String type;
  int contact;
  String email;
  String accountNumber;

  getData()async{
  var temp2 = await DBprovider.db.getPartyDetails();
  setState(() {
    temp = temp2;
    temp.forEach((element){
      type = element['PartyType'];
      email= element['EmailAddress'];
      contact= element['ContactNo'];
      accountNumber= element['AccountNo'];

    });
  });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    setState((){
      name = data['name'];
    });
    List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.person, color: Colors.white,), route: '/addParty')];
    int color_Red = 109;
    int color_Green = 11;
    int color_Blue = 93;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double image_height=  phone_height * 0.052;
    double image_width = phone_width *0.149;
    double textfield_gap = phone_height *0.0125;
    double button_gap = phone_height *0.063;
    double divider_width = phone_width * 0.8;
    double image_container_width=phone_width*0.219;
    double image_container_height=phone_height*0.113;
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
      appBar: std_appbar(context, name.toString(), color_Red, color_Green, color_Blue),
      bottomNavigationBar: std_chinbar(context, color_Red, color_Green, color_Blue),
      floatingActionButton: std_FAB(Colors.white, 109, 11, 93, buttons, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
                    margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 25.0),
                    height: image_container_height,
                    width: image_container_width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                      child: Image.asset('assets/Frame 7.png',height: image_height, width: image_width,),
                  ),
          Expanded(
            child: Container(
              width: phone_width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22)
                )
                ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:50.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'Type',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            type!=null? type : '',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 28.0,
                          endIndent: 28.0
                        )
                      ]
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'Contact No.',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            contact!=null? contact.toString(): '',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue),fontSize: 12)
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 28.0,
                          endIndent: 28.0
                        )
                      ]
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'Email',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            email!=null ? email: '',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.blue),fontSize: 12)
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 28.0,
                          endIndent: 28.0
                        )
                      ]
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget> [
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 33.0),
                    //       child: Text(
                    //         'Address',
                    //         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                    //       ),
                    //     ),
                    //     SizedBox(height: 15.0),
                    //
                    //       Container(
                    //         width: phone_width*0.365,
                    //         padding: EdgeInsets.only(left: 33.0),
                    //         child: Text(
                    //           '255-K Street#5, DHA, Lahore',
                    //           style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                    //         ),
                    //       ),
                    //
                    //     Divider(
                    //       color: Colors.grey,
                    //       indent: 28.0,
                    //       endIndent: 28.0
                    //     )
                    //   ]
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            'Account No.',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 33.0),
                          child: Text(
                            accountNumber!=null? accountNumber:'',
                            style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey),fontSize: 12)
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: Colors.grey,
                          indent: 28.0,
                          endIndent: 28.0
                        )
                      ]
                    )
                  ]
                ),
                
                )
            ) ,
            )
        ]
      )
    );
  }
}