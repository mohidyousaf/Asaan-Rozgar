import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';


//filter flows:
//inventory_filter() -> filter_list
//expenses_filter() -> expense_filters -> calendar_sheet() -> calendar
//sale_purchase_filter() -> sale_purchase_filters -> calendar_sheet() -> calendar
//party_filter() -> party_filters_display -> calendar_sheet() -> calendar

class filter_list extends StatefulWidget {
  @override
  _filter_listState createState() => _filter_listState();
}

class _filter_listState extends State<filter_list> {
   int selected_value;
   String dropdownvalue;
   var temp = ['Temp1','Temp2','Temp3','Temp4','Temp5','Temp6','Temp7','Temp8'];
   var selected_range=RangeValues(0, 10000);
   @override
   void init_State(){
     super.initState();
     selected_value = 0;
     dropdownvalue = "";
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

   void price_range(RangeValues values){
     setState(() {
       selected_range=values;
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
                          labelText: 'Type your input here',
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
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Range',
                      style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                      ),
                    Container(
                      width: box_width,
                      height: box_height,
                      // decoration: ShapeDecoration(
                      //   color: Colors.grey[100],
                      //   shape: RoundedRectangleBorder(
                      //     side: BorderSide(style: BorderStyle.solid),
                      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //   ) 
                      // ),
                      child: RangeSlider(
                        values: selected_range,
                        min: 0,
                        max: 100000,
                        divisions: 10,
                        activeColor: Color.fromRGBO(11, 71, 109, 1.0),
                        //inactiveColor: Colors.red,
                        labels: RangeLabels(
                          selected_range.start.toString(),
                          selected_range.end.toString()
                          ),
                        onChanged: (RangeValues values){
                          price_range(values);
                        }
                      //Text('Hello',
                        ),
                    ),
                  ],
                ):Text(''),
                selected_value==5?
                Text(''):Text('')
              ]
            ),
          )

      ],
    );
  }
}

void inventory_filter(context){
  int filter_options=0;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return SingleChildScrollView(
                      child: Container(
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
                      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                      child: long_circleBtt('Apply',255,159,10),
                    )

                ],
                ),
            ),
          );
      }
    );
}

class expense_filters extends StatefulWidget {
  @override
  _expense_filtersState createState() => _expense_filtersState();
}

class _expense_filtersState extends State<expense_filters> {
  String selected_drop;
  var expense=['None','Salary','Rent'];
  @override
  void initState(){
    super.initState();
    selected_drop=expense[0];
  }
  void select_dropdown(String val){
    setState(() {
      selected_drop=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    double phone_width=MediaQuery.of(context).size.width;
    double phone_height=MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return Column(
        children: [
              Container(
                  width: box_width,
                  //height: box_height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Type',
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
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                  ) 
                                                ),
                         child: DropdownButton<String>(
                           value: selected_drop,
                           icon: const Icon(Icons.arrow_drop_down),
                           style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                           hint: Text(
                             ' Select Type of Expense',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                           ),
                            items: expense.map((String dropDownStringItem){
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
                    
                    SizedBox(height: 30.0,),
                    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontWeight: FontWeight.bold,fontSize: 16.0),
                ),
                Container(
                  width: box_width,
                  height: box_height,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    )
                  ),
                  child: FlatButton.icon(
                    padding: EdgeInsets.only(left: 310.0),
                    onPressed: (){
                      calendar_sheet(context,12,109,109);
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Color.fromRGBO(11, 71, 109, 1.0),
                      ),
                    label: Text(''),
                    ),
                )
              ],
              ),
              SizedBox(height: 30.0,),

                    ],
                  )
                )
           
      ],);
  }
}

void expenses_filter(context){
  int filter_options=0;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return SingleChildScrollView(
                      child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0)
                ),
                color: Colors.white
                ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                                    child: Divider(
                      indent: 165,
                      endIndent: 180,
                      thickness: 5.0,
                      color: Colors.grey,
                    ),
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
                        Align(
                          alignment: Alignment.center,
                                                child: Text(
                            'Filters',
                            style: GoogleFonts.lato(textStyle: TextStyle(
                              color: Color.fromRGBO(11, 71, 109, 1.0)),
                              fontSize: 24.0,
                              ),
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
                    //filter_list(),
                    expense_filters(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 20.0),
                      child: long_circleBtt('Apply',12,109,109),
                    )

                ],
                ),
            ),
          );
      }
    );
}

void calendar_sheet(context,int color_red,int color_green,int color_blue){
  int filter_options=0;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return SingleChildScrollView(
                      child: Container(
              height: 500.0,
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
                          'Date',
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
                    //filter_list(),
                    //expense_filters(),
                    calendar(),
                    //SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: long_circleBtt('Confirm',color_red,color_green,color_blue),
                    )
                    

                ],
                ),
            ),
          );
      }
    );
}


class calendar extends StatefulWidget {
  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  int month= DateTime.now().month;
  DateTime selectedDay;
  int currentState;
  var monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August','September','October', 'November', 'December'];
  var temp = ['Temp1','Temp2','Temp3','Temp4','Temp5','Temp6','Temp7','Temp8'];
  String dropdownvalue;
  @override
  void initState(){
    super.initState();
    dropdownvalue= monthList[month-1];
  }
  void select_dropdown(String value){
    setState(() {
      dropdownvalue=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return Container(
      height: 350.0,
      width: 370,
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                //height: 300,
                width: slider_width,
                child: CupertinoSlidingSegmentedControl(
                         groupValue: currentState,
                         backgroundColor: Color.fromRGBO(118, 118, 128, 0.12),
                         children: <int, Widget>{
                           0: Text('Day',
                               style: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1.0),
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,

                                 )
                              ),
                           1: Text('Month',
                               style: TextStyle(
                                 color: Color.fromRGBO(11, 71, 109, 1.0),
                                 fontFamily: "Lato",
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14,
                               )
                             )
                         },
                         onValueChanged: (v){
                           setState(() {
                             currentState = v;
                           });
                         },
                     ),
              ),
            ],
          ),
          currentState==0?
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              // decoration: BoxDecoration(
              //   color: Color.fromRGBO(118, 118, 128, 0.12),
              //   borderRadius: BorderRadius.circular(10)
              // ),
              child: TableCalendar(
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Color.fromRGBO(136, 182, 211, 1.0)
                ),
                formatButtonVisible: false,
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  size: 15.0,
                  color: Color.fromRGBO(11, 71, 109, 1.0)
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15.0,
                  color: Color.fromRGBO(11, 71, 109, 1.0)
                ),
                
                //leftChevronMargin: EdgeInsets.only(left: 5.0)
                //leftChevronPadding: EdgeInsets.only(left: 20.0)
                leftChevronPadding: EdgeInsets.only(left: 100.0),
                rightChevronPadding: EdgeInsets.only(right: 100.0)
              ),
              rowHeight: phone_width*0.086,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: _calendarFormat,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(136,182, 211, 1.0),
                ),
                todayTextStyle: TextStyle(color: Colors.white),
                selectedTextStyle: TextStyle(color: Colors.white),
                defaultTextStyle: TextStyle(color: Colors.black),
                outsideTextStyle: TextStyle(color: Color.fromRGBO(11, 71, 109, 1.0)),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(46,189, 133, 1.0),
                )
              ),
              selectedDayPredicate: (day){
                return isSameDay(selectedDay,day);
              },
              onDaySelected: (chosenday,focusedDay){
                setState(() {
                  selectedDay=chosenday;
                  _focusedDay=focusedDay;
                  // print(focusedDay);
                });
              },
              onPageChanged: (focusedDay){
                _focusedDay=focusedDay;
              },
        ),
            ),
          ):Text(''),
          currentState==1?
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Month',
                    style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                  ),
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
                               value: dropdownvalue,
                               icon: const Icon(Icons.arrow_drop_down),
                               style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                               hint: Text(
                                 ' Select Month',
                                 style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                               ),
                               //items: [DropdownMenuItemString('Hello'),Text('Hello2')],
                                items: monthList.map((String dropDownStringItem){
                                  //print(items.where);
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
                         SizedBox(height:30.0),
                          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Year',
                    style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: box_width,
                      height: box_height,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Type your input here',
                          labelStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,))
                        ),
                      ),
                    )
                ],)
                ],
              ), 
            ],
          ):Text(''),
        ]
      )
    );
  }
}

void sale_purchase_filter(context){
  int filter_options=0;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return SingleChildScrollView(
                      child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0)
                  ),
                  color: Colors.white
                  ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                                      child: Divider(
                        indent: 165,
                        endIndent: 180,
                        thickness: 5.0,
                        color: Colors.grey,
                      ),
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
                          Align(
                            alignment: Alignment.center,
                                                  child: Text(
                              'Filters',
                              style: GoogleFonts.lato(textStyle: TextStyle(
                                color: Color.fromRGBO(11, 71, 109, 1.0)),
                                fontSize: 24.0,
                                ),
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
                      //filter_list(),
                      //expense_filters(),
                      sale_purchase_filters(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                        child: long_circleBtt('Apply',11,71,109),
                      )

                  ],
                  ),
              ),
          );
      }
    );
}

class sale_purchase_filters extends StatefulWidget {
  @override
  _sale_purchase_filtersState createState() => _sale_purchase_filtersState();
}

class _sale_purchase_filtersState extends State<sale_purchase_filters> {
  String dropdownCategory;
  String dropdownParty;
  var temp=['Temp1','Temp2','Temp3','Temp4'];
  @override
  void init_State(){
    super.initState();
    dropdownCategory=temp[0];
    dropdownParty=temp[0];
  }
  void selected_Category(String value){
    setState(() {
      dropdownCategory=value;
    });
  }

  void selected_Party(String value){
    setState(() {
      dropdownParty=value;
    });
  }
  Widget build(BuildContext context) {
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return Column(
      children: <Widget> [
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
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                  ) 
                                                ),
                         child: DropdownButton<String>(
                           value: dropdownCategory,
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
                             selected_Category(newvalue);
                           },
                         ),
                       ),
                     )

                    ],
                  )
                ),
                SizedBox(height: 30.0),
                Container(
                  width: box_width,
                  //height: box_height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Partner',
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
                                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                  ) 
                                                ),
                         child: DropdownButton<String>(
                           value: dropdownParty,
                           icon: const Icon(Icons.arrow_drop_down),
                           style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                           hint: Text(
                             ' Select Partner',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                           ),
                           items: temp.map((String dropDownStringItem){
                             return DropdownMenuItem<String>(
                               value: dropDownStringItem,
                               child: Text(dropDownStringItem),
                              );
                           }).toList(),
                           onChanged: (String newvalue){
                             selected_Party(newvalue);
                           },
                         ),
                       ),
                     )

                    ],
                  )
                ),
                SizedBox(height: 30.0,),
                    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontWeight: FontWeight.bold,fontSize: 16.0),
                ),
                Container(
                  width: box_width,
                  height: box_height,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    )
                  ),
                  child: FlatButton.icon(
                    padding: EdgeInsets.only(left: 310.0),
                    onPressed: (){
                      calendar_sheet(context,11,71,109);
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Color.fromRGBO(11, 71, 109, 1.0),
                      ),
                    label: Text(''),
                    ),
                )
              ],
              ),

      ]
    );
  }
}

void party_filter(context){
  int filter_options=0;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
          return SingleChildScrollView(
                      child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0)
                ),
                color: Colors.white
                ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                                    child: Divider(
                      indent: 165,
                      endIndent: 180,
                      thickness: 5.0,
                      color: Colors.grey,
                    ),
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
                        Align(
                          alignment: Alignment.center,
                                                child: Text(
                            'Filters',
                            style: GoogleFonts.lato(textStyle: TextStyle(
                              color: Color.fromRGBO(11, 71, 109, 1.0)),
                              fontSize: 24.0,
                              ),
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
                    //filter_list(),
                   // expense_filters(),
                   party_filters_display(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                      child: long_circleBtt('Apply',109,11,93),
                    )

                ],
                ),
            ),
          );
      }
    );
}


class party_filters_display extends StatefulWidget {
  @override
  _party_filters_displayState createState() => _party_filters_displayState();
}

class _party_filters_displayState extends State<party_filters_display> {
  String selected_drop;
  var balance=['None','Paid','Unpaid'];
  @override
  void initState(){
    super.initState();
    selected_drop=balance[0];
  }
  void select_dropdown(String val){
    setState(() {
      selected_drop=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    double phone_width=MediaQuery.of(context).size.width;
    double phone_height=MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return SingleChildScrollView(
          child: Column(
          children: [
                Container(
                    width: box_width,
                    //height: box_height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Text(
                         'Balance',
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
                                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                    ) 
                                                  ),
                           child: DropdownButton<String>(
                             value: selected_drop,
                             icon: const Icon(Icons.arrow_drop_down),
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,)),
                             hint: Text(
                               ' Select Type of Balance',
                               style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                             ),
                              items: balance.map((String dropDownStringItem){
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
                      
                      SizedBox(height: 30.0,),
                      Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black),fontWeight: FontWeight.bold,fontSize: 16.0),
                  ),
                  Container(
                    width: box_width,
                    height: box_height,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                    ),
                    child: FlatButton.icon(
                      padding: EdgeInsets.only(left: 300.0),
                      onPressed: (){
                        calendar_sheet(context,109,11,93);
                      },
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: Color.fromRGBO(11, 71, 109, 1.0),
                        ),
                      label: Text(''),
                      ),
                  )
                ],
                ),
                SizedBox(height: 30.0,),
                Text(
                         'Type',
                         style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                       ),
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
                               ' Select Type of Party',
                               style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                             ),
                              items: balance.map((String dropDownStringItem){
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
                    )
                  )
             
        ],),
    );
  }
}