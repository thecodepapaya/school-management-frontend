import 'package:flutter/material.dart';
import 'package:school_mgmt/data/authData.dart';
import 'package:school_mgmt/models/auth.dart';

class AuthScreen extends StatefulWidget {
  final AuthType authType;
  final Widget nextscreen;

  AuthScreen({
    @required this.authType,
    @required this.nextscreen,
  });

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  List<Auth> authList = AuthData.allAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Authentication"),
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Authentication",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 80),
                TextFormField(
                  controller: usernameController,
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 50),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      if (isValid()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => widget.nextscreen,
                          ),
                        );
                      } else {
                        print("Invalid Creds");
                      }
                    } else {
                      print("Invalid");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValid() {
    
  }
}
