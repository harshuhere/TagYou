import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tagyou/constant.dart';
import 'package:tagyou/homepage.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String logIN = "http://tagyou.siddhidevelopment.com/api/v1/auth/login";

  login(email, password) async {
    Map data = {'email': email, 'password': password};
    print(data.toString());
    final response = await get(
      Uri.parse(logIN),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> user = resposne['data'];
        print(" User name ${user['id']}");
        // savePref(1,user['name'],user['email'],user['id']);
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => MyHomePage()));
      } else {
        print(" ${resposne['message']}");
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${resposne['message']}")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please try again!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
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
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70, left: 160),
              child: FlatButton(
                onPressed: () {},
                textColor: mainColor,
                child: Text(
                  'Forgot your Password?',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                login(nameController.text, passwordController.text);
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Text(
                    'LOGIN',
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
    );
  }
}
