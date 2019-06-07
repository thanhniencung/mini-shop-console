import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';
import 'package:mini_shop_console/shared/ui_utils.dart';
import 'package:mini_shop_console/viewmodel/product_viewmodel.dart';
import 'package:mini_shop_console/viewmodel/cate_viewmodel.dart';
import 'package:mini_shop_console/model/cate.dart';
import 'package:mini_shop_console/model/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:mini_shop_console/model/error.dart';

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

  ProductViewModel productViewModel;
  CateViewModel cateViewModel;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cateViewModel = CateViewModel.of(context);
    productViewModel = ProductViewModel.of(context);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: TextFormField(
                  validator: (value) {
                    return productViewModel.validateProductName(value);
                  },
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
                  validator: (value) {
                    return productViewModel.validatePrice(value);
                  },
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
                  validator: (value) {
                    return productViewModel.validateQuantity(value);
                  },
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
                          uploadImage(productViewModel);
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

              SizedBox(height: 20,),
              productViewModel.image == null ? Container() : Image.network(
                  productViewModel.image
              ),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                        submitForm(context);
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
            ],
          ),
        )
      ),
    );
  }

  void submitForm(BuildContext context) {
    var valid = formKey.currentState.validate();
    if (valid) {
      var loadDialog = new ProgressDialog(context,ProgressDialogType.Normal);
      loadDialog.setMessage('Đang tải...');
      loadDialog.show();

      Future.delayed(const Duration(seconds: 2), () {
        loadDialog.hide();

        productViewModel.addProduct().then((product) {
          UIUtils.toastSuccessMessage(context, "Thêm sản phẩm thành công");
        })
        .catchError((e) {
          if (e is Error) {
            UIUtils.toastErrorMessage(context, e.message);
          }
        });
      });
    }
  }

  Future uploadImage(ProductViewModel model) async {
    var file =  await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      return null;
    }

    int MAX_WIDTH = 500;
    ImageProperties properties = await FlutterNativeImage.getImageProperties(file.path);
    File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: 80,
        targetWidth: MAX_WIDTH,
        targetHeight: (properties.height * MAX_WIDTH / properties.width).round());

    model.uploadImage(compressedFile)
        .then((result) {
          print(result);
          productViewModel.image = result.toString();
        }
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

          CateData data = snapshot.data[i];

          if (i == 0 && productViewModel.cateId == null) {
            productViewModel.cateId = data.cateId;
          }

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
          value: productViewModel.cateId,
          items: options,
          onChanged: (newCateId) {
            productViewModel.onDropdownChange(newCateId);
          }
        );
    }
  }
}