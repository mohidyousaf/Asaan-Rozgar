import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// void main() => runApp(MaterialApp(home: LineGraph()));

class LineGraph extends StatefulWidget {
  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<charts.Series<Value, int>> _seriesLineData;

  _generateData() {
    var net_profit = [
      new Value(0, 25, "January"),
      new Value(1, 35, "January"),
      new Value(2, 70, "January"),
      new Value(3, 45, "February"),
      new Value(4, 55, "March"),
      new Value(5, 90, "April"),
      new Value(6, 61, "May"),
    ];
    var expenses = [
      new Value(0, 60, "January"),
      new Value(1, 45, "January"),
      new Value(2, 35, "January"),
      new Value(3, 40, "February"),
      new Value(4, 85, "March"),
      new Value(5, 65, "April"),
      new Value(6, 51, "May"),
    ];

    var income = [
      new Value(0, 40, "January"),
      new Value(1, 65, "January"),
      new Value(2, 55, "January"),
      new Value(3, 45, "February"),
      new Value(4, 25, "March"),
      new Value(5, 40, "April"),
      new Value(6, 45, "May"),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(Color.fromRGBO(23, 225, 67, 1.0)),
        id: 'Air Pollution',
        data: net_profit,
        domainFn: (Value data, _) => data.monthval,
        measureFn: (Value data, _) => data.val,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(Color.fromRGBO(255, 0, 0, 1.0)),
        id: 'Air Pollution',
        data: expenses,
        domainFn: (Value data, _) => data.monthval,
        measureFn: (Value data, _) => data.val,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(Color.fromRGBO(11, 71, 109, 1.0)),
        id: 'Air Pollution',
        data: income,
        domainFn: (Value data, _) => data.monthval,
        measureFn: (Value data, _) => data.val,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<Value, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: <Widget>[
          Expanded(
            child: charts.LineChart(
              _seriesLineData,
              defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true, stacked: true),
              animate: false,
              layoutConfig: new charts.LayoutConfig(
                  leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  topMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  rightMarginSpec: new charts.MarginSpec.fixedPixel(1),
                  bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)),
              domainAxis: new charts.NumericAxisSpec(
                  showAxisLine: false,
                  renderSpec: new charts.NoneRenderSpec()),
              primaryMeasureAxis:
                  charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
            ),
          ),
        ],
      ),
    );
  }
}

class Value {
  int monthval;
  int val;
  String monthname;

  Value(this.monthval, this.val, this.monthname);
}
