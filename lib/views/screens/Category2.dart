import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'About_App_Page.dart';
import 'About_Us_Page.dart';
//import 'package:untitled4/view/screens/category.dart';

class Category2 extends StatefulWidget {
  const Category2({Key? key}) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  final Stream<QuerySnapshot> categoryStream =
      FirebaseFirestore.instance.collection('category').snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: categoryStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(161, 255, 153, 0),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(); //............
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text("CATEGORIES"),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => About_Us_Page()));
                  },
                  icon: Icon(Icons.people)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => About_App_Page()));
                  },
                  icon: Icon(Icons.help)),
            ],
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  ListTile(
                    title: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          data['image'],
                          fit: BoxFit.cover,
                        )),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                          child: Text(
                        data['name'],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      height: 10,
                      color: Colors.blue,
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
