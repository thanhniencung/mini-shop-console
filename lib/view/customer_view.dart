import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Khách hàng"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
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
          child: CustomerWidget(),
        )
    );
  }
}

class CustomerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerStateWidget();
  }
}

class _CustomerStateWidget extends State<CustomerWidget> {
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
              children: <Widget>[
                Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://znews-stc.zdn.vn/static/topic/person/do%20my%20linh.jpg")
                        )
                )),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Nguyễn Trí Huệ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 5.0,),
                    Text("2 tiếng trước", style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
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