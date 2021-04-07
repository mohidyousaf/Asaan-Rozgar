import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/buttons.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';


// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       theme: ThemeData(
//         primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
//         accentColor: Colors.white,
//         textTheme: GoogleFonts.latoTextTheme(),
//       ),
//       home: company_setup()
//   ));
// }

class company_setup extends StatefulWidget {
  @override
  _company_setupState createState() => _company_setupState();
}

class _company_setupState extends State<company_setup> {
  @override
  Widget build(BuildContext context) {
    //final color_setting = Color.fromRGBO(color_Red,color_Green,color_Blue,1.0)
    int color_Red = 11;
    int color_Green = 71;
    int color_Blue = 109;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double longBtt_width = phone_width * 0.487;
    double longBtt_height = phone_height* 0.051;
    double image_height=  phone_height * 0.20;
    double image_width = phone_width *0.5;
    double textfield_gap = phone_height *0.0125; 
    double button_gap = phone_height *0.063;
    return Scaffold(
      backgroundColor: Color.fromRGBO(color_Red,color_Green,color_Blue,1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue, 1.0),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Setup Account',
          style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0,bottom: 20.0),
            child: Image(image: AssetImage('assets/Frame 8.png'),height: image_height,width: image_width),
          ),
          Expanded(
            child: Container(
               padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0), 
                //height: 547.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  )
                ),
                child: SingleChildScrollView(
                                  child: Column(
                    children: <Widget>[
                      input_text_fields('Available Cash (Rs.)',''),
                      SizedBox(height: textfield_gap),
                      input_text_fields('Cash In Account (Rs.)',''),
                      SizedBox(height: textfield_gap),
                      input_text_fields('Land Price (Rs.)',''),
                      SizedBox(height: textfield_gap),
                      input_text_fields('Cost on Business Building (Rs.)',''),
                      SizedBox(height: textfield_gap),
                      input_text_fields('Owners Equity (Rs.)',''),
                      SizedBox(height: button_gap),
                      long_circleBtt('Next'),
                      // Container(
                      //     height: longBtt_height,
                      //     width: longBtt_width,
                      //     child: Material(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       shadowColor: Colors.grey[900],
                      //       color: Color.fromRGBO(11, 71, 109, 1.0),
                      //       elevation: 7.0,
                      //       child: FlatButton(
                      //         onPressed: () {},
                      //         child: Center(
                      //           child: Text(
                      //             'Next',
                      //             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     )

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