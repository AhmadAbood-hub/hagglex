import 'package:flutter/material.dart';
import './sign_in.dart';
import './configuration.dart';
import './country.dart';
import './verify.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: PrimaryColor,
        body: ListView(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Card(
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: accentColor,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignIn()));
                            })),
                  ),
                ),
                Expanded(flex: 3, child: SizedBox())
              ],
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.meduimText),
              child: Card(
                elevation: 4,
                child: Container(
                  height: SizeConfig.screenHeight,
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.meduimText),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: SizeConfig.largText),
                              child: Row(
                                children: [
                                  Text(
                                    "Create a new account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.meduim2Text),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.largText,
                                  right: SizeConfig.largText),
                              child: Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              labelText: 'Email Address',
                                              labelStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      SizeConfig.meduimText)),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (val) {
                                            if (val.isEmpty ||
                                                !val.contains('@')) {
                                              return 'Invalid email';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {}),
                                      TextFormField(
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      SizeConfig.meduimText)),
                                          validator: (val) {
                                            if (val.isEmpty || val.length < 5) {
                                              return 'Password is too short!';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {}),
                                      TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              labelText: 'Create a username',
                                              labelStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      SizeConfig.meduimText)),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (val) {
                                            if (val.isEmpty) {
                                              return 'Please enter username';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {}),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Countries()));
                                        },
                                        child: Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                    ),
                                                    width: 80,
                                                    height: 35,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Image.asset(
                                                                "images/flag.png"),
                                                          ),
                                                          Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                "(+234)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: TextFormField(
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .purple),
                                                        ),
                                                        labelText:
                                                            'Enter your phone number',
                                                        labelStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: SizeConfig
                                                                .meduimText)),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Please enter your phone number';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (val) {}),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      ),
                                      TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                              labelText: 'Referral link',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey
                                                      .withOpacity(0.8),
                                                  fontSize:
                                                      SizeConfig.meduimText)),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (val) {
                                            if (val.isEmpty) {
                                              return 'Please enter username';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {}),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.02,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.meduim2Text,
                                            right: SizeConfig.meduim2Text),
                                        child: Text(
                                          "By signing. you agree to HaggleX terms and privacy policy.",
                                          style: TextStyle(
                                              fontSize: SizeConfig.smallText),
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.screenHeight * 0.05,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.largText,
                                            right: SizeConfig.largText),
                                        child: FlatButton(
                                          height:
                                              SizeConfig.screenHeight * 0.08,
                                          minWidth: SizeConfig.screenWidth,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          color: PrimaryColor,
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Verify()));
                                          },
                                          child: Text(
                                            "SIGN UP",
                                            style: TextStyle(
                                                fontSize: SizeConfig.meduimText,
                                                color: accentColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
