import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/Authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  const firebaseconfig = FirebaseOptions(
      apiKey: "AIzaSyD8_fG5dlPhfqWpWOiQnMBR545fXuzaJUA",
      appId: "1:871799210904:android:7c71dd169a466de0faa1ed",
      messagingSenderId: "871799210904",
      projectId: "geolocation-app-9edbc");
  await Firebase.initializeApp(options: firebaseconfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider.value(value: Authservice().user, initialData: null),
        ],
        child: MaterialApp(
          // Application name
          title: 'Geolocation App',

          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // A widget which will be started on application startup
          home: Wrapper(),
        ));
  }
}
