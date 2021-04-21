import 'package:flutter/material.dart';
import './Widgets/std_appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './Widgets/percChart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
 MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new PercentageChart())
      )
  );}



class PercentageChart extends StatefulWidget {
  @override
  _PercentageChartState createState() => _PercentageChartState();
}

class _PercentageChartState extends State<PercentageChart> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: std_appbar(context, "label", 0, 0, 0),
      body: percChart(0.3, Color.fromRGBO(11, 71, 109, 1), "30%")
      
    );
  }
}