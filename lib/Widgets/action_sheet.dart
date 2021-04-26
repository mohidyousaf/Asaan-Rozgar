//Action Sheets Widgets.
//This page contains all the bottom sheets that will pop up when filter is tapped on any page.
//The flows of filters are as follows:
//Filter for inventory: inventory_filter() -> filter_list
//Filter for expenses: expenses_filter() -> expense_filters -> calendar_sheet() -> calendar
//Filter for sale and purchase: sale_purchase_filter() -> sale_purchase_filters -> calendar_sheet() -> calendar
//Filter for party recvs and payabs: party_filter() -> party_filters_display -> calendar_sheet() -> calendar

import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/temp.dart';


//The child class to inventory_filter() that contains all the filters for inventory.
class filter_list extends StatefulWidget {
  filter_list({this.valFunc, this.model, this.searchController, this.categoryFunc, this.priceFunc, this.quantityFunc});
  var model;
  var searchController;
  Function quantityFunc;
  Function categoryFunc;
  Function priceFunc;
  Function valFunc;
  @override
  _filter_listState createState() => _filter_listState();
}
class _filter_listState extends State<filter_list> {
   int selected_value;
   String dropdownvalue;
   List<String> temp;
   var selected_range;
   var selected_q_range;
   double minPrice;
   double maxPrice;
   double minQuantity;
   double maxQuantity;
   void catFunc(){
     var list = widget.model.getCategories();
     minPrice = widget.model.minPrice.toDouble();
     maxPrice = widget.model.maxPrice.toDouble();
     minQuantity = widget.model.minQuantity.toDouble();
     maxQuantity = widget.model.maxQuantity.toDouble();
      print('$minPrice, $maxPrice');
     setState(() {
       temp = list.toList();
       dropdownvalue = temp[0];
       selected_range = RangeValues(minPrice, minPrice + (maxPrice - minPrice)/10);
       selected_q_range = RangeValues(minQuantity, minQuantity + (maxQuantity - minQuantity)/10);

     });
   }
   @override
   void initState(){
     super.initState();
     selected_value = 0;
     catFunc();

   }
   //This selects the type of filter to be applied. (selection for radio buttons)
   void selected_button(int value){
     setState(() {
       selected_value=value;
     });
     widget.valFunc(value);
   }
   //This is the selection for the drop down menu in one of the filters.
   void selected_drop(String value){
     setState(() {
       dropdownvalue=value;
     });
     widget.categoryFunc(value);
   }
   //This function selects the price range in one of the filters.
   void price_range(RangeValues values){
     setState(() {
       selected_range=values;
     });
     widget.priceFunc(values);
   }
   //This function selects the quantity in one of the filters.
   void quantity_range(RangeValues values){
     setState(() {
       selected_q_range=values;
     });
     widget.quantityFunc(values);
   }
  @override
  Widget build(BuildContext context) {
    //Varaiables for properties of the page.
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    //Returns all the filters that can be applied on inventory.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35.0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Radio button for partner/party name filter. 
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
        //Radio button for Category Tag filter.
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
        //Radio button for quantity filter.
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
          //Radio button for sale price filter.
          SizedBox(
            height: 35.0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Sale Price',
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
          //Radio button for low stock items filter.
          SizedBox(
            height: 35.0,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Text(
                'Low Stock Items',
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
          //Generates the appropriate filter as selected by the user.
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: Stack(
              children: <Widget> [
                //Search field for partner name.
                selected_value==1?
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextField(
                          controller: widget.searchController,
                          onChanged: (text){
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.fromLTRB(20,3,20,3),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search',
                            hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  const Radius.circular(16.0),)
                            ),
                          ),
                        ),
                ):
                //Slider for quantity.
                selected_value==3?
                Column(
                  children: [
                    Text(
                      'Quantity',
                      style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                    ),
                    Container(
                      width: box_width,
                      height: box_height,
                      child: RangeSlider(
                          values: selected_q_range,
                          min: 0,
                          max: maxQuantity + 1,
                          divisions: 20,
                          activeColor: Color.fromRGBO(11, 71, 109, 1.0),
                          labels: RangeLabels(
                              selected_q_range.start.toInt().toString(),
                              selected_q_range.end.toInt().toString()
                          ),
                          onChanged: (RangeValues values){
                            quantity_range(values);
                          }
                      ),
                    ),
                  ],
                ):Text(''),
                //Drop down dor category tag.
                selected_value==2?
                Container(
                  width: box_width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Category Tag',
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
                             ' Select Category Tag',
                             style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey,)),
                           ),
                           items: temp != null ? temp.map((String dropDownStringItem){
                             return DropdownMenuItem<String>(
                               value: dropDownStringItem,
                               child: Text(dropDownStringItem),
                              );
                           }).toList():
                           ['empty'].map((String dropDownStringItem){
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
                //Slider for price range.
                selected_value==4?
                Column(
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
                        max: maxPrice + 1,
                        divisions: 20,
                        activeColor: Color.fromRGBO(11, 71, 109, 1.0),
                        labels: RangeLabels(
                          'Rs. ' + selected_range.start.toInt().toString(),
                          'Rs. ' + selected_range.end.toInt().toString()
                          ),
                        onChanged: (RangeValues values){
                          price_range(values);
                        }
                        ),
                    ),
                  ],
                ):Text(''),
                //For the selection of stock being low.
                selected_value==5?
                Text(''):Text('')
              ]
            ),
          )

      ],
    );
  }
}

//This function opens the buttom sheet and provides with the necessary skeleton elements.
inventory_filter(context){
  final myModel = Provider.of<InventoryModel>(context, listen: false);
  var catVal;
  var priceVals;
  var quantityVals;
  var filterVal;
  TextEditingController searchController = new TextEditingController();
  Function valFunc(val){
    filterVal = val;
  }
  Function categoryFunc(text){
    catVal = text;
  }
  Function priceFunc(text){
    priceVals = text;
  }
  Function quantityFunc(text){
    quantityVals = text;
  }
  int filter_options=0;
  //This makes the bottom sheet pop up.
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
                //Creates the header of the bottom sheet.
              child: Column(
                children: [
                  Center(
                    child: Container(

                      margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                      height: 4,
                        width: 100,
                        decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        )
                    )
                    ),
                  ),
                  //Prints the word filter on top and has a divider below it.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                     ),
                        Center(
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
                        )
                    ]
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 24,
                      endIndent: 24,
                    ),
                    filter_list(model:myModel, searchController: searchController,
                        categoryFunc:categoryFunc, priceFunc:priceFunc, valFunc: valFunc,
                          quantityFunc: quantityFunc),
                  //Creates a button for apply.
                  Container(
                    padding: EdgeInsets.fromLTRB(120, 20, 120, 50),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey[900],
                      color: Color.fromRGBO(255, 159, 10, 1.0),
                      elevation: 7.0,
                      child: TextButton(
                        onPressed: () async {
                          var searchString = searchController.text.toString();
                          myModel.filterItems(types:[filterVal],
                              searchText: searchString,
                              categoryVal:catVal,
                              priceVals:priceVals,
                              quantityVals: quantityVals);
                          Navigator.of(context).pop();

                        },
                        child: Center(
                          child: Text(
                            'Apply',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
                ),
            ),
          );
      }
    );
}


//The child class to expenses_filter() that contains all the filters for expenses.
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
  //This is to select an option from the drop down menu.
  void select_dropdown(String val){
    setState(() {
      selected_drop=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    double phone_width=MediaQuery.of(context).size.width;
    double phone_height=MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    //Returns all the filters that can be applied on expenses.
    return Column(
        children: [
          //Contains a drop down for type of expenses.
              Container(
                  width: box_width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                    //Creates a button to filter by date.
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

//This function opens the buttom sheet and provides with the necessary skeleton elements for expenses.
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
                  Divider(
                      indent: 165,
                      endIndent: 165,
                      thickness: 5.0,
                      color: Colors.grey,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Center(
                           child: Text(
                              'Filters',
                              style: GoogleFonts.lato(textStyle: TextStyle(
                                color: Color.fromRGBO(11, 71, 109, 1.0)),
                                fontSize: 24.0,
                                ),
                            ),
                         ),
                      
                    ]
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 24,
                      endIndent: 24,
                    ),
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

//The parent widget for calendar, this opens provides the skeletal elements for the bottom sheet of calendar.
void calendar_sheet(context,int color_red,int color_green,int color_blue){
  int filter_options=0;
  //This makes the bottom sheet pop up for calendar.
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
                //Creates the header for the sheet.
              child: Column(
                children: [
                  Divider(
                    indent: 165,
                    endIndent: 165,
                    thickness: 5.0,
                    color: Colors.grey,
                  ),
                  //Adds the words "Date" on the header.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                        Center(
                          child: Text(
                            'Date',
                            style: GoogleFonts.lato(textStyle: TextStyle(
                              color: Color.fromRGBO(11, 71, 109, 1.0)),
                              fontSize: 24.0,
                              ),
                          ),
                        ),
                    ]
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 24,
                      endIndent: 24,
                    ),
                    calendar(),
                    //Button for confirming the date filters.
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


//The child class to calendar_sheet() that contains all the filters for calendar.
class calendar extends StatefulWidget {
  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  //The necessary variables to remember the date from the calendar,
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  int month= DateTime.now().month;
  DateTime selectedDay;
  //The varaibles for drop downs and slider button options.
  int currentState;
  var monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August','September','October', 'November', 'December'];
  var temp = ['Temp1','Temp2','Temp3','Temp4','Temp5','Temp6','Temp7','Temp8'];
  String dropdownvalue;
  @override
  void initState(){
    super.initState();
    dropdownvalue= monthList[month-1];
  }
  //Selects the value from a drop down menu.
  void select_dropdown(String value){
    setState(() {
      dropdownvalue=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    //Variables for the properties of the page.
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double slider_width=phone_width*0.834;
    double slider_height=phone_height*0.0417;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    //Returns the container containing the filters for the calendar.
    return Container(
      height: 350.0,
      width: 370,
      child: Column(
        children: <Widget>[
          Column(
            children: [
              //Slider button to select between: Day and, Month.
              Container(
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
          //For if day is selected.
          currentState==0?
          //Creates a calendar that can take the date selected and show the present date.
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              child: TableCalendar(
              //Creates the header of the calendar for changing the months.
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
                
                leftChevronPadding: EdgeInsets.only(left: 100.0),
                rightChevronPadding: EdgeInsets.only(right: 100.0)
              ),
              //Creates the actual calendar with all the dates.
              rowHeight: phone_width*0.086,
              firstDay: DateTime.utc(2021, 01, 01),
              lastDay: DateTime.utc(2090, 01, 01),
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
                });
              },
              onPageChanged: (focusedDay){
                _focusedDay=focusedDay;
              },
        ),
            ),
          ):Text(''),
          //For if month was selected.
          currentState==1?
          Column(
            children: [
              //Drop down menu for months.
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
                         //Text Field for selection of year.
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


//This function opens the buttom sheet and provides with the necessary skeleton elements for expenses.
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
                     Divider(
                        indent: 165,
                        endIndent: 165,
                        thickness: 5.0,
                        color: Colors.grey,
                      ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                                'Filters',
                                style: GoogleFonts.lato(textStyle: TextStyle(
                                  color: Color.fromRGBO(11, 71, 109, 1.0)),
                                  fontSize: 24.0,
                                  ),
                              ),
                        ),
                          
                      ]
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 24,
                        endIndent: 24,
                      ),
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


//The child class to sale_purchase_filter() that contains all the filters for sale and, purchase.
class sale_purchase_filters extends StatefulWidget {
  @override
  _sale_purchase_filtersState createState() => _sale_purchase_filtersState();
}

class _sale_purchase_filtersState extends State<sale_purchase_filters> {
  //Variables to select drop down value.
  String dropdownCategory;
  String dropdownParty;
  var temp=['Temp1','Temp2','Temp3','Temp4'];
  @override
  void init_State(){
    super.initState();
    dropdownCategory=temp[0];
    dropdownParty=temp[0];
  }
  //This selects the drop down value of category.
  void selected_Category(String value){
    setState(() {
      dropdownCategory=value;
    });
  }

  //This selects the drop down value of the party.
  void selected_Party(String value){
    setState(() {
      dropdownParty=value;
    });
  }
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    double phone_width= MediaQuery.of(context).size.width;
    double phone_height= MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    //Returns the filters for recvs and payables in parties.
    return Column(
      children: <Widget> [
        //Creates a drop down for Category Tag.
        Container(
                  width: box_width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Category Tag',
                       style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0,)),
                     ),
                     DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
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
                      ),
                     )

                    ],
                  )
                ),
                SizedBox(height: 30.0),
                //Creates a drop down for Partner/Party.
                Container(
                  width: box_width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(
                       'Partner',
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
                //Creates a button to get filters for date.
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


//This function opens the buttom sheet and provides with the necessary skeleton elements for expenses.
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
                      endIndent: 165,
                      thickness: 5.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                     Center(
                       child: Text(
                              'Filters',
                              style: GoogleFonts.lato(textStyle: TextStyle(
                                color: Color.fromRGBO(11, 71, 109, 1.0)),
                                fontSize: 24.0,
                                ),
                            ),
                     ),
                        
                    ]
                    ),
                    Divider(
                      color: Colors.grey,
                      indent: 24,
                      endIndent: 24,
                    ),
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


//The child class to sale_purchase_filter() that contains all the filters for sale and, purchase.
class party_filters_display extends StatefulWidget {
  @override
  _party_filters_displayState createState() => _party_filters_displayState();
}

class _party_filters_displayState extends State<party_filters_display> {
  //Variables for drop down.
  String selected_drop;
  var balance=['None','Paid','Unpaid'];
  @override
  void initState(){
    super.initState();
    selected_drop=balance[0];
  }
  //To select values for drop down.
  void select_dropdown(String val){
    setState(() {
      selected_drop=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    //Variables for properties of the page.
    double phone_width=MediaQuery.of(context).size.width;
    double phone_height=MediaQuery.of(context).size.height;
    double box_width=phone_width*0.857;
    double box_height=phone_height*0.0527;
    return SingleChildScrollView(
          child: Column(
          children: [
            //Drop down for balance.
                Container(
                    width: box_width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Text(
                         'Balance',
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
                  //Button to access filters for date.
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
                //Drop down for type.
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