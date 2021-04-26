import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Dashbord extends StatelessWidget {
  final String email;
  Dashbord({this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Center(
            child: Text(email),
          ),
          RaisedButton(
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
              SystemNavigator.pop();
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
