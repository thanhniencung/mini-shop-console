import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/user_viewmodel.dart';
import 'package:mini_shop_console/model/user.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
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
        body: ChangeNotifierProvider<UserViewModel>(
          builder: (_) => UserViewModel(),
          child: UserWidget(),
        )
    );
  }
}

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserStateWidget();
  }
}

class _UserStateWidget extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {

    UserViewModel userViewModel = UserViewModel.of(context);

    return FutureBuilder<Object>(
      future: userViewModel.listUsers(),
      builder: (context, snapshot) {

          if (snapshot.hasData) {

              List<UserData> data = snapshot.data;
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
                        children: <Widget>[
                          Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(data[position].avatar)
                                  )
                          )),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(data[position].displayName,
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
          } else if (snapshot.hasError) {
            return Center(child: new Text("${snapshot.error}", textAlign: TextAlign.center,));
          }

          return Center(child: new CircularProgressIndicator());
      }
    );
  }
}