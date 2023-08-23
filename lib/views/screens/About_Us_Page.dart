import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About_Us_Page extends StatefulWidget {
  const About_Us_Page({super.key});

  @override
  State<About_Us_Page> createState() => _About_Us_PageState();
}

class _About_Us_PageState extends State<About_Us_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(161, 255, 153, 0),
        title: const Text('Developers'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            '''Developed by:
   
    1. Karam walid zarif
    2. Amany naser salah
    3. Mohamed ebrahim amr
    4. Mohamed abdelaziz atlm
   ''',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 71, 71, 71),
            ),
          ),
        ),
      ),
    );
  }
}
