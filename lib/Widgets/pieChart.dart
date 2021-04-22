import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';  
  
  Widget pieChartOne(context, Map<String, double> dataMap,List<Color> colorsList){
    return PieChart(
      dataMap:dataMap,
      initialAngleInDegree: 0,
      animationDuration: Duration(milliseconds: 900),
      chartType: ChartType.disc,
      chartRadius: MediaQuery.of(context).size.width/2.5,
      ringStrokeWidth:32,
      colorList: colorsList,
      chartLegendSpacing: 20,
     
      chartValuesOptions: ChartValuesOptions(
        showChartValuesOutside: false,
        showChartValuesInPercentage: true,
        showChartValueBackground: true,
        showChartValues: true

      ),
      // centerText:'Spending',

      legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendPosition: LegendPosition.right,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
        )
      )
      );
  }