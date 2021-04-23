import 'dart:ffi';

import 'package:asaanrozgar/Inventory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MaterialApp(home: LineGraph_inventory()));

class LineGraph_inventory extends StatefulWidget {
  @override
  _LineGraph_inventoryState createState() => _LineGraph_inventoryState();
}

class _LineGraph_inventoryState extends State<LineGraph_inventory> {
  List<charts.Series<item_value, int>> _seriesLineData;

  _generateData() {
    var data_item = [
      new item_value(0, 36),
      new item_value(1, 35),
      new item_value(2, 43),
      new item_value(3, 45),
      new item_value(4, 55),
      new item_value(5, 47),
      new item_value(6, 52),
      new item_value(7, 32),
      new item_value(8, 35),
      new item_value(9, 42),
      new item_value(10, 45),
      new item_value(11, 55),
      new item_value(12, 42),
      new item_value(13, 52),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(Color.fromRGBO(23, 225, 67, 1.0)),
        id: 'Item data',
        data: data_item,
        domainFn: (item_value data, _) => data.monthval,
        measureFn: (item_value data, _) => data.val,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<item_value, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: charts.LineChart(
              _seriesLineData,
              defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true, stacked: true),
              animate: true,
              animationDuration: Duration(seconds: 2),
              layoutConfig: new charts.LayoutConfig(
                  leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  topMarginSpec: new charts.MarginSpec.fixedPixel(15),
                  rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
                  bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)),
              domainAxis: new charts.NumericAxisSpec(
                  showAxisLine: false, renderSpec: new charts.NoneRenderSpec()),
              primaryMeasureAxis:
                  charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
            ),
          ),
        ],
      ),
    );
  }
}

class item_value {
  int monthval;
  int val;

  item_value(this.monthval, this.val);
}
