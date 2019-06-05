import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';
import 'package:mini_shop_console/viewmodel/product_viewmodel.dart';
import 'package:mini_shop_console/viewmodel/cate_viewmodel.dart';
import 'package:mini_shop_console/model/cate.dart';

class AddProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Thêm sản phẩm"),
          backgroundColor: primary,
          leading: IconButton(
            icon: Icon(Icons.close),
            padding: EdgeInsets.all(4.0),
            iconSize: 34.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (context) => ProductViewModel()),
            Provider(builder: (context) => CateViewModel()),
          ],
          child: AddProductWidget(),
        ),
    );
  }
}

class AddProductWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddProductStateWidget();
  }
}

class _AddProductStateWidget extends State<AddProductWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cateViewModel = CateViewModel.of(context);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: "Tên sản phẩm",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Text("Danh mục", style: TextStyle(fontSize: 17.0, color: primary, fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            FutureBuilder(
                future: cateViewModel.loadCates(),
                builder: (context, snapshot) {
                  return _buildCategories(context, snapshot);
                }
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Nhập giá ",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Số Lượng",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Thêm hình ảnh sản phẩm", style: TextStyle(fontSize: 17.0,color: primary, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: () {
                      },
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: primary,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /*SizedBox(height: 20,),

            Image.network(
              'http://daitangkinhvietnam.org/sites/default/files/get_image/images1004264_1.jpg',
            ),*/

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                  },
                  color: primary,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Thêm sản phẩm",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),

          ],
        )
      ),
    );
  }

  Widget _buildCategories(context, snapshot) {
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    }

    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator());

      default:
        List<DropdownMenuItem> options = [];
        var cates = new Map();

        for (int i=0; i < snapshot.data.length; i++) {

          Data data = snapshot.data[i];

          cates.addAll({
            "${data.cateId}" : data.cateName
          });

          options.add(DropdownMenuItem<String>(
            child: Text(data.cateName),
            value: "${data.cateId}",
          ));
        }

        return DropdownButton(
          iconEnabledColor: primary,
          isExpanded: true,
          value: "1a5b851c-86ef-11e9-8cad-8c8590cefb77",
          items: options,
          onChanged: (newItem) => {

          },
        );
    }
  }
}