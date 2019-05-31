import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Bảng tin"),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: DashboardWidget(),
        )
    );
  }
}

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardStateWidget();
  }
}

class _DashboardStateWidget extends State<DashboardWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Thống kê theo ngày",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue
                  )),
            ),
            SizedBox(
              height: 200.0,
              child: charts.TimeSeriesChart(
                  _createSampleData(),
                  animate: false,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            buildCard("Tổng thu"),
            SizedBox(
              height: 15.0,
            ),
            buildCard("Tổng chi"),
            SizedBox(
              height: 15.0,
            ),
            buildCard("Tồn kho"),
            SizedBox(
              height: 15.0,
            ),
            buildCard("Khách nợ")
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title) {
    return Card(
      color: Color(0xfff6f6f6),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text("1/2019",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("250,000,000 VNĐ", style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 1, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 2, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 3, 3), 50),
      new TimeSeriesSales(new DateTime(2017, 4, 10), 100),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}