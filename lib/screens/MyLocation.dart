import 'package:android/services/Database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String?>(context);
    return StreamBuilder<QuerySnapshot>(
        stream: Dataservice(uid: user!).locationStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xffdbb50c),
                  title: Text("My Location Page"),
                  centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          color: Color(0xffdbb50c),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "Latitude : ${snapshot.data!.docs[index].get("Latitude")}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Longitude : ${snapshot.data!.docs[index].get("Longitude")}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 5);
                      },
                      itemCount: snapshot.data!.size),
                ));
          } else {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xffdbb50c),
                  title: Text("My Location Page"),
                  centerTitle: true,
                ),
                body: Center(child: Text("No data to show")));
          }
        });
  }
}
