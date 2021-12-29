// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tagyou/constant.dart';
import 'package:tagyou/loginpage.dart';
import 'package:tagyou/registrationpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = "https://tagyou.siddhidevelopment.com/api/v1/offer_detail";

  void fetchData() async {
    final response = await get(Uri.parse(url));
    Map<String, dynamic> map =
        jsonDecode(response.body) as Map<String, dynamic>;
    print(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text(
              'For..',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              fetchData();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: const Center(
                child: Text(
                  'CREATORS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Text(
                    'COMPANIES',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Text(
                'Already have an account?',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    // textColor: Colors.blue,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 17, color: mainColor),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyLoginPage()));
                    },
                  ),
                  Text(
                    'here',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ))
        ],
      ),
    );
  }
}
