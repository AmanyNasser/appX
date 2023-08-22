import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'Body1.dart';
import 'Body2.dart';
import 'Body3.dart';
import 'Category2.dart';

class Homescreen extends StatefulWidget {
  //...........
  String email;
  Homescreen({super.key, required this.email, required String Password});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //..............
  int currentIndex = 0;
  List<Widget> page = [
    Body1(),
    Body2(),
    Body3(),
    Category2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 600,
            child: page[currentIndex],
          ),
          /* Center(
              child: Text(
            widget.email,
            style: TextStyle(fontSize: 30),
          )),*/
        ],
      ),
      //  body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_4_rounded,
                color: Colors.black,
              ),
              label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              label: 'Favourits'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: Colors.black,
              ),
              label: 'Category'),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(value);
          });
        },
      ),
    );
  }
}
