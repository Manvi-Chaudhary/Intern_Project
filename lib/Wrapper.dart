import 'Authenticate/Authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:android/screens/Btmnav.dart';
import 'services/Authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String?>(context);
    print(user);
    if (user != null) {
      return Btmnav();
    } else {
      return Authenticate();
    }
  }
}
