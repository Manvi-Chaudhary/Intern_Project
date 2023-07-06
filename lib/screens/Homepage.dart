import 'package:android/services/Authentication.dart';
import 'package:android/services/Database.dart';
import 'package:android/services/Geolocater.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String?>(context);
    var errorsnackbar = SnackBar(
      content: Text(
        "Please enable location permissions",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    );
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffdbb50c),
            title: Text("Home Page"),
            centerTitle: true,
            actions: [
              TextButton.icon(
                  onPressed: () async {
                    await Authservice().signout();
                  },
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: Text(" "))
            ]),
        body: Center(
            child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Center(
                    child: TextButton(
                        onPressed: () async {
                          dynamic pos = await Geolocater().determinePosition();
                          if (pos != null) {
                            print(pos.latitude);
                            print(pos.longitude);
                            await Dataservice(uid: user!).location(
                                pos.latitude.toString(),
                                pos.longitude.toString());
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(errorsnackbar);
                          }
                        },
                        child: Text(
                          "Show My Location",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))))));
  }
}
