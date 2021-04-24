import 'package:flutter/material.dart';

import './configuration.dart';
import './register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

bool _isHidden = true;

final _phoneController = TextEditingController();
final _passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double xLarg = SizeConfig.xlargText;

    double larg = SizeConfig.largText;
    double small = SizeConfig.smallText;

    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: larg, right: larg),
        child: ListView(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            Text(
              "Welcome !",
              style: TextStyle(
                  fontSize: xLarg + small,
                  color: accentColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0633,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val.isEmpty || !val.contains('@')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onSaved: (val) {}),
                    TextFormField(
                        obscureText: _isHidden,
                        obscuringCharacter: "*",
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                  _isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                        controller: _passwordController,
                        validator: (val) {
                          if (val.isEmpty || val.length < 5) {
                            return 'Password is too short!';
                          }
                          return null;
                        },
                        onSaved: (val) {}),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Text("Forgat Password?",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: small, color: accentColor)),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.meduimText,
                  left: SizeConfig.smallText,
                  right: SizeConfig.smallText),
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.xlargText + SizeConfig.largText,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: buttonColor,
                  onPressed: () {
                    //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //      builder: (BuildContext context) => Home()));
                  },
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                        fontSize: SizeConfig.meduimText,
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Register()));
                },
                child: Text("New User?Create a new account",
                    style: TextStyle(fontSize: small, color: accentColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.xlargText + SizeConfig.largText,
      width: SizeConfig.screenWidth,
      color: PrimaryColor,
      child: new TextFormField(
        controller: _phoneController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          hintStyle:
              TextStyle(fontSize: SizeConfig.smallText, color: Colors.white),
          contentPadding:
              EdgeInsets.only(left: SizeConfig.screenHeight * 0.033),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.xlargText + SizeConfig.largText,
      width: SizeConfig.screenWidth,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: accentColor,
        child: Center(
          child: new TextFormField(
            controller: _passwordController,
            obscureText: _isHidden,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: TextStyle(
                  fontSize: SizeConfig.smallText, color: PrimaryColor),
              contentPadding: EdgeInsets.only(
                  left: SizeConfig.screenHeight * 0.033,
                  top: SizeConfig.screenHeight * 0.02),
              suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
