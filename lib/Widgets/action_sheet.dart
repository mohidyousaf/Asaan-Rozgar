import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';


class filter_list extends StatefulWidget {
  @override
  _filter_listState createState() => _filter_listState();
}

class _filter_listState extends State<filter_list> {
   int selected_value;
   String dropdownvalue;
   var temp = ['Temp1','Temp2','Temp3','Temp4','Temp5','Temp6','Temp7','Temp8'];
   @override
   void init_State(){
     super.initState();
     selected_value=0;
     dropdownvalue="";
   }

   void selected_button(int value){
     setState(() {
       selected_value=value;
     });
   }
   void selected_drop(String value){
     setState(() {
       dropdownvalue=value;
     });
   }
  @override
  Widget build(BuildContext context) {
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35.0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Partner Name',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: Radio(
                value: 1,
                groupValue: selected_value,
                activeColor: Colors.blue[900],
                onChanged: (val)=>{
                  selected_button(val)
                },
                ),
            )
          ],
          ),
        ),
        SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Category Tag',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: Radio(
                value: 2,
                groupValue: selected_value,
                activeColor: Colors.blue[900],
                onChanged: (val)=>{
                  selected_button(val)
                },
                ),
            )

            ],
            ),
        ),
          SizedBox(
            height: 35.0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Quantity',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: Radio(
                value: 3,
                groupValue: selected_value,
                activeColor: Colors.blue[900],
                onChanged: (val)=>{
                  selected_button(val)
                },
                ),
            )

            ],
            ),
          ),
          SizedBox(
            height: 35.0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Price',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: Radio(
                value: 4,
                groupValue: selected_value,
                activeColor: Colors.blue[900],
                onChanged: (val)=>{
                  selected_button(val)
                },
                ),
            )

            ],
            ),
          ),
          SizedBox(
            height: 35.0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Low Stock Price',
                style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: Radio(
                value: 5,
                groupValue: selected_value,
                activeColor: Colors.blue[900],
                onChanged: (val)=>{
                  selected_button(val)
                },
                ),
            )

            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: Stack(
              children: <Widget> [
                selected_value==1?
                Text('Implement Search bar here'):Text(''),
                selected_value==3?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Quantity',
                    style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: box_width,
                      height: box_height,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Type you input here',
                          labelStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,))
                        ),
                      ),
                    )
                ],):Text(''),
                selected_value==2?
                Container(
                  width: box_width,
                  //height: box_height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Category Tag',
                       style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                     ),
                     //SizedBox(height: 50.0,),
                     DropdownButtonHideUnderline(
                                            child: Container(
                                              width: box_width,
                                              height: box_height,
                                              decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(style: BorderStyle.solid),
                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  ) 
                                                ),
                         child: DropdownButton<String>(
                           value: dropdownvalue,
                           icon: const Icon(Icons.arrow_drop_down),
                           style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                           hint: Text(
                             ' Select Category Tag',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                           ),
                           items: temp.map((String dropDownStringItem){
                             return DropdownMenuItem<String>(
                               value: dropDownStringItem,
                               child: Text(dropDownStringItem),
                              );
                           }).toList(),
                           onChanged: (String newvalue){
                             selected_drop(newvalue);
                           },
                         ),
                       ),
                     )

                    ],
                  )
                ):Text(''),
                selected_value==4?
                Text('$box_height'):Text(''),
                selected_value==5?
                Text(''):Text('')
              ]
            ),
          )

      ],
    );
  }
}
// Widget filter_list(String label){
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Padding(
//         padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
//         child: Text(
//           'Partner Name',
//           style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),fontSize: 18.0,),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
//         child: Radio(
//           value: 0,
//           groupValue: 'filter_types',
//           activeColor: Colors.black,
//           onChanged: (context)=>{
//           },
//           ),
//       )
//     ],
//     );
// }

void inventory_filter(context){
  int filter_options=0;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0)
              ),
              color: Colors.white
              ),
            child: Column(
              children: [
                Divider(
                  indent: 165,
                  endIndent: 180,
                  thickness: 5.0,
                  color: Colors.grey,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                     child: IconButton(
                       icon: Icon(Icons.close),
                        onPressed: (){
                          Navigator.of(context).pop();
                        }
                        ),
                   ),
                      Text(
                        'Filters',
                        style: GoogleFonts.lato(textStyle: TextStyle(
                          color: Color.fromRGBO(11, 71, 109, 1.0)),
                          fontSize: 24.0,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: TextButton(
                          onPressed: () {},
                           child: Text(
                             'Reset',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                           )),
                      )
                  ]
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 24,
                    endIndent: 24,
                  ),
                  filter_list(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: long_circleBtt('Apply',255,159,10),
                  )

              ],
              ),
          );
      }
    );
}