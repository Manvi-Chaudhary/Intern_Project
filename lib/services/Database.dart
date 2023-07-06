import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Dataservice {
  String uid = "";

  Dataservice({required this.uid});

  CollectionReference record =
      FirebaseFirestore.instance.collection("UserData");

  Future cred(String email, String username, String password) async {
    return await record
        .doc(uid)
        .set({"Email": email, "Username": username, "Password": password});
  }

  Stream<DocumentSnapshot> get credStream {
    return record.doc(uid).snapshots();
  }

  Future location(String latitude, String longitude) async {
    return await record.doc(uid).collection("Location").doc().set(
        {"Latitude": latitude, "Longitude": longitude, "Time": DateTime.now()});
  }

  Stream<QuerySnapshot> get locationStream {
    return record
        .doc(uid)
        .collection("Location")
        .orderBy("Time", descending: true)
        .snapshots();
  }

  Future<String?> getemail(String username, String password) async {
    QuerySnapshot s = await record
        .where("Username", isEqualTo: username)
        .where("Password", isEqualTo: password)
        .get();
    if (s.docs == []) {
      return null;
    }
    return s.docs[0]["Email"];
  }
}
