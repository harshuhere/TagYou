// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tagyou/constant.dart';
import 'package:http/http.dart' as http;
import 'package:tagyou/homepage.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController genController = TextEditingController();
  TextEditingController resController = TextEditingController();
  TextEditingController conpController = TextEditingController();
  TextEditingController instController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();

  bool isChecked = false;

  String reg = "https://tagyou.siddhidevelopment.com/api/v1/auth/register";

  signup(fname, lname, gender, residence, email, password, igname) async {
    var headers = {
      'Accept': 'application/json',
      'lang': 'en',
      'apiKey': 'T56c5+xwOzn/BjwN774rJ6ugk8i/N7GYJuL2KpxXhuo=',
      'appversion': 'v1',
      'deviceId': '123',
      'deviceType': '1',
      'deviceToken': '1234'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('http://tagyou.siddhidevelopment.com/api/v1/auth/register'));
    request.fields.addAll({
      'first_name': '$fname',
      'last_name': '$lname',
      'email': '$email@siddhiinfosoft.com',
      'password': '$password',
      'is_term_accept': '1',
      'role': '3',
      'dob': '22-08-1994',
      'gender': '$gender',
      'address': '$residence',
      'instagram_client_id': '$igname'
    });
    // request.files.add(await http.MultipartFile.fromPath(
    //     'profile_img', '/C:/Users/Harshu Patel/Desktop/background.png'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print("----->>>>>>${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(50),
                          child: CircleAvatar(
                            maxRadius: 80,
                            backgroundImage:
                                AssetImage('images/background.png'),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 85,
                          bottom: 50,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[200],
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: fnameController,
                              validator: (value) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'FirstName',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: lnameController,
                              validator: (value) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'LastName',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: genController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Gender',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: resController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Residence',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            return 'Please enter vaild Email ';
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: conpController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: instController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Instgram Name',
                        ),
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            checkColor: Colors.purple.shade800,
                            activeColor: Colors.purple.shade800,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                      ),
                      Text(
                        'I accept  ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.purple.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    InkWell(
                      onTap: () {
                        signup(
                            fnameController.text,
                            lnameController.text,
                            genController.text,
                            resController.text,
                            emailController.text,
                            passController.text,
                            instController.text);
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
