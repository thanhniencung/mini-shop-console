import 'package:flutter/material.dart';
import 'package:mini_shop_console/model/product.dart';
import 'package:provider/provider.dart';
import 'package:mini_shop_console/viewmodel/product_viewmodel.dart';

/*
    CENTER = none
    CENTER_CROP = Cover
    CENTER_INSIDE = scaleDown
    FIT_CENTER = contain (alignment.center)
    FIT_END = contain (alignment.bottomright)
    FIT_START = contain (alignment.topleft)
    FIT_XY = Fill
 */
class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Sản phẩm"),
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

        body: ChangeNotifierProvider<ProductViewModel>(
          builder: (_) => ProductViewModel(),
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
  ProductViewModel productViewModel;

  @override
  Widget build(BuildContext context) {
    productViewModel = ProductViewModel.of(context);

    return FutureBuilder<Object>(
      future: productViewModel.listProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          List<Product> data = snapshot.data;
          if (data.length == 0) {
            return Center(child: new Text("Không có dữ liệu", textAlign: TextAlign.center,));
          }

          return ListView.builder(
            itemCount: data.length ,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, position) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        data[position].productImage,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
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
                                  Text(
                                    data[position].productName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text("SL: ${data[position].quantity} x ${data[position].price}", style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue),
                                  ),
                                  SizedBox(height: 2.0,),
                                  Text("Đã bán: ${data[position].soldItems} x ${data[position].price}", style: TextStyle(
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
        } // end if

        else if (snapshot.hasError) {
          return Center(child: new Text("${snapshot.error}", textAlign: TextAlign.center,));
        }

        return Center(child: new CircularProgressIndicator());

      }
    );
  }
}