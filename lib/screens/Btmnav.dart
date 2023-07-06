import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyLocation.dart';
import 'Homepage.dart';

class Btmnav extends StatefulWidget {
  const Btmnav({Key? key}) : super(key: key);
  _BtmnavState createState() => _BtmnavState();
}

class _BtmnavState extends State<Btmnav> {
  @override
  int _selectedindex = 0;
  List<Widget> _page = [
    HomePage(),
    MyLocation(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "My Location")
        ],
        selectedItemColor: Color(0xffdbb50c),
        currentIndex: _selectedindex,
        unselectedItemColor: Color(0xffb4b4b2),
        //unselectedLabelStyle: TextStyle(color: Color(0xffb4b4b2)),
        onTap: (int index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
    );
  }
}
