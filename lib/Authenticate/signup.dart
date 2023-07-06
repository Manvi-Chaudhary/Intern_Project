import 'package:flutter/material.dart';
import 'package:android/services/Authentication.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  const SignUp({Key? key, required this.toggle}) : super(key: key);
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String username = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var errorsnackbar = SnackBar(
      content: Text(
        "An Error Occurred , make sure email is correct",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    );
    return Scaffold(
        body: Form(
            key: _formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                    validator: ((value) {
                      return (value!.isEmpty)
                          ? "Please enter a valid email"
                          : null;
                    }),
                    onChanged: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                        ),
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid)))),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  validator: ((value) {
                    return (value!.isEmpty) ? "Please enter a Password" : null;
                  }),
                  onChanged: (val) {
                    password = val;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                      ),
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid))),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  validator: ((value) {
                    return (value!.isEmpty) ? "Please enter a Username" : null;
                  }),
                  onChanged: (val) {
                    username = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: 'Enter Username',
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
                  Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        widget.toggle();
                      },
                      child: Text("Sign in",
                          style: TextStyle(color: Color(0xffdbb50c))))
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      dynamic res =
                          await Authservice().signup(email, username, password);
                      if (res == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(errorsnackbar);
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
                      child: Text("Create",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ))
            ])));
  }
}
