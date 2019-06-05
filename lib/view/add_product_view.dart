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

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
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
          FutureBuilder(
              future: cateViewModel.loadCates(),
              builder: (context, snapshot) {

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());

                    default:
                      List<DropdownMenuItem> options = [];
                      var cates = new Map();

                      //print(snapshot.data.length);
                      print("======");
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
        ],
      )
    );
  }
}