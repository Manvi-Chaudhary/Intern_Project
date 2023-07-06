// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:android/services/Authentication.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn({Key? key, required this.toggle}) : super(key: key);
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username = "";
  String password = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var errorsnackbar = SnackBar(
      content: Text(
        "An Error Occurred , please check the credentials entered",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    );
    return Scaffold(
        body: Form(
      key: _formkey,
      child: Column(children: [
        Container(
            height: 200,
            width: 200,
            child: Image(image: AssetImage("assets/images/logo.PNG"))),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            onChanged: (value) => username = value,
            validator: ((value) {
              return (value!.isEmpty) ? "Please enter a valid username" : null;
            }),
            decoration: InputDecoration(
                hintText: "Enter Username",
                prefixIcon: Icon(
                  Icons.person,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                        width: 10,
                        color: Colors.black,
                        style: BorderStyle.solid))),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            onChanged: (value) => password = value,
            validator: ((value) {
              return (value!.isEmpty) ? "Please enter a Password" : null;
            }),
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_rounded,
                ),
                hintText: "Enter Password",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid))),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Don't have an account?"),
            TextButton(
                onPressed: () {
                  widget.toggle();
                },
                child: Text(
                  "Create",
                  style: TextStyle(color: Color(0xffdbb50c)),
                ))
          ],
        ),
        SizedBox(height: 20),
        TextButton(
            onPressed: () async {
              if (_formkey.currentState!.validate()) {
                dynamic res = await Authservice().signin(username, password);
                if (res == null) {
                  ScaffoldMessenger.of(context).showSnackBar(errorsnackbar);
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffdbb50c),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 160,
              child: Center(
                child: Text("Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            )),
        /*TextButton(
            child: Text('sign in anonmously'),
            onPressed: () async {
              await Authservice().phone();
            }),*/
      ]),
    ));
  }
}
