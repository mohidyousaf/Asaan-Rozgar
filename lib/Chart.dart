import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import './Widgets/std_appbar.dart';
import 'Widgets/pieChart.dart';


// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//  MediaQuery(
//       data: new MediaQueryData(),
//       child: new MaterialApp(home: new ABC())
//       )
//   );}


  
class ABC extends StatefulWidget {
  @override
  _ABCState createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  
  @override
  
  Widget build(BuildContext context) {
  
  Map<String, double> dataMap = {
    'BILLS':1,
    'SALARY': 1,
    'RENT': 1,
  };

  List<Color> colorsList = [
    Color.fromRGBO(136, 182, 211, 1),
    Color.fromRGBO(38, 51, 58, 1),
    Color.fromRGBO(11,71,109, 1),  
    ];
  
    return 
       Scaffold(
       appBar: std_appbar(context, "label", 11,71,109),
       backgroundColor: Color.fromRGBO(11, 71, 109, 1),

       body: 
       Center(
         child: 
         Container(
           padding: EdgeInsets.symmetric(horizontal: 3),
         height: MediaQuery.of(context).size.width * 0.40,
         width: MediaQuery.of(context).size.width*0.9,
         // margin: EdgeInsets.only(top: 200),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.all(
           Radius.circular(20),
         ),
         ),
      child: 
      Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
            children: [
              Text("Expenses",
              style: TextStyle(fontSize: 17)
              ),
              
              pieChartOne(context, dataMap, colorsList),
            ],
        ),
      ) 
         ),
       )
      )
    ;
  }
}