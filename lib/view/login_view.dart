import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.orange[300],
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: LoginWidget(),
        )
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginStateWidget();
  }
}

class _LoginStateWidget extends State<LoginWidget> {
  var formKey = GlobalKey<FormState>();
  LoginViewModel model;

  @override
  Widget build(BuildContext context) {

    model = LoginViewModel.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 120.0,
                height: 120.0,
              ),
              new SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Form(
                  key: formKey,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          initialValue: model.phone,
                          validator: (value) {
                            print("validate phone");
                            return model.validatePhone(value);
                          },
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Số điện thoại",
                            icon: const Icon(Icons.phone),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: backgroundGray1)
                            ),
                            disabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: backgroundGray1)
                            ),
                          ),
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          initialValue: model.password,
                          validator: (value) {
                            print("validate pass");
                            return model.validatePass(value);
                          },
                          obscureText: true,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            labelText: "Mật khẩu",
                            icon: const Icon(Icons.lock),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: backgroundGray1)
                            ),
                            disabledBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: backgroundGray1)
                            ),
                          ),
                        ),
                        new SizedBox(
                          height: 40.0,
                        ),
                        RaisedButton(
                          onPressed: () {
                            submitForm(context);
                          },
                          color: Colors.orange[600],
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: Center(
                              child: Text(
                                "ĐĂNG NHẬP",
                                style: TextStyle(fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm(BuildContext context) {
    var valid = formKey.currentState.validate();
    if (valid) {
      var loadDialog = new ProgressDialog(context,ProgressDialogType.Normal);
      loadDialog.setMessage('Đang tải...');
      loadDialog.show();

      Future.delayed(const Duration(seconds: 3), () {
        model.login().then((result) {
          loadDialog.hide();

          print(result.data);
          Navigator.pushNamed(context, '/home');
        }).catchError((e) {
          print(e);
          loadDialog.hide();
        });
      });
    }
  }
}