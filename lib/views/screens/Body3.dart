import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'About_App_Page.dart';
import 'About_Us_Page.dart';

class Body3 extends StatefulWidget {
  const Body3({super.key});

  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  final Stream<QuerySnapshot> productStream =
      FirebaseFirestore.instance.collection('product').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // snapshot.connectionState == ConnectionState.active;
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
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
            title: Text("FAVOURITS"),
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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  ListTile(
                    title: Text(data['Item']),
                    subtitle: Text(data['Price']),
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
