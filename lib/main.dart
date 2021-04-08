import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class LoginData {
  String name = "";
  String username = "";
  String password = "";
  String address = "";
  String tel = "";
}

class _MyApp extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    try {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // some code
            print('Action in Snackbar has been pressed.');
          },
        ),
      ));
    } on Exception catch (e, s) {
      print(s);
    }
  }

  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
        home: Scaffold(
            key: _scaffoldKey,
            body: Container(
                padding: EdgeInsets.all(50.0),
                child: Form(
                    key: this._formKey,
                    child: Column(children: [
                      TextFormField(
                          onSaved: (String inValue) {
                            this._loginData.name = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              labelText: "Your First Name And Last Name")),
                      TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Address";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.address = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Your Address", labelText: "Address")),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Tel";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.tel = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Your Telephon Number",
                              labelText: "Phone Number")),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter Email";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.username = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "_@email.com",
                              labelText: "E-Mail address")),
                      TextFormField(
                          obscureText: true,
                          validator: (String inValue) {
                            if (inValue.length < 10) {
                              return "Password must be >=10 in length";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.password = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Password", labelText: "Password")),
                      RaisedButton(
                        child: Text("Log In"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _showMessageInScaffold(
                                "Welcome to System, ${_loginData.name}, ${_loginData.address}, ${_loginData.tel}");

                            print("Welcome to Animate System , ");
                            print("Name: ${_loginData.name}");
                            print("Username: ${_loginData.username}");
                            print("Password: ${_loginData.password}");
                          }
                        },
                      )
                    ])))));
  }
}
