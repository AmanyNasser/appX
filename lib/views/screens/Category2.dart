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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                gridViewCategoryItem(
                    img: 'assets/Category/iphoneCat.png',
                    name: 'Iphones',
                    context: context),
                gridViewCategoryItem(
                    img: 'assets/Category/phoneCat.jpg',
                    name: 'Smart Phones',
                    context: context),
                gridViewCategoryItem(
                    img: 'assets/Category/airpodsCat.jpg',
                    name: 'AirPods',
                    context: context),
                gridViewCategoryItem(
                    img: 'assets/Category/headsetCat.jpg',
                    name: 'Headsets',
                    context: context),
                gridViewCategoryItem(
                    img: 'assets/Category/screenCat.jpeg',
                    name: 'Screens',
                    context: context),
                gridViewCategoryItem(
                    img: 'assets/Category/smartwatchCat.jpg',
                    name: 'SmartWatches',
                    context: context),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget gridViewCategoryItem(
    {required String img, required String name, required var context}) {
  return InkWell(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                img,
              ),
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
