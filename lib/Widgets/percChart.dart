import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget percChart(double perc,Color chartColor, String label, String bottomText){
    return new CircularPercentIndicator(
                  radius: 130.0,
                  lineWidth: 10.0,
                  percent: perc,
                  center: new Text(label,
                  style: TextStyle(
                              color: chartColor,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                               )
                  ),
                  footer: 
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(bottomText,
                    style: TextStyle(
                                color: chartColor,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                 )
                    ),
                  ),
                  progressColor: chartColor,
                );
  }