import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Sản phẩm"),
        ),
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: ProductWidget(),
        )
    );
  }
}

class ProductWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductStateWidget();
  }
}

class _ProductStateWidget extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'http://banhtrungthuviet.com/files/sanpham/51/1/jpg/cosy-banh-quy-bo-sua-378g.jpg',
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(width: 12.0),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Sữa chocolate Sữa chocolate Sữa chocolate Sữa chocolate Sữa chocolate ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            SizedBox(height: 5.0,),
                            Text("SL: 10 x 25.000", style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue),
                            ),
                            SizedBox(height: 2.0,),
                            Text("Đã bán: 3 x 25.000", style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text("Hết hàng", style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.red),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}