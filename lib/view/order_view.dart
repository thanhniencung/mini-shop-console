import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Đơn hàng"),
          iconTheme: new IconThemeData(color: Colors.white),
          actions: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_today),
                padding: EdgeInsets.all(4.0),
                iconSize: 32.0,
                color: Colors.white,
                onPressed: () {

                },
              ),
          ],
        ),
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: OrderWidget(),
        )
    );
  }
}

class OrderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderStateWidget();
  }
}

class _OrderStateWidget extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("#004456799", style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                      ),
                    ),
                    Text("Nguyễn Trí Huệ", style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("2 tiếng trước", style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("500.000.000", style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.red
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Đã thu tiền", style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.green
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}