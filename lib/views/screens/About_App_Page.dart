import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/views/screens/About_Us_Page.dart';

class About_App_Page extends StatefulWidget {
  const About_App_Page({super.key});

  @override
  State<About_App_Page> createState() => _About_App_PageState();
}

class _About_App_PageState extends State<About_App_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(161, 255, 153, 0),
        title: const Text('About App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''
this is an ecommerce application which you can buy stuff here .
stuff like smartphones or screens also you can buy smartwatches here and bluetooth headphones too .
you can have an account here too by clicking sign up and writing your number and email .
this app have simple screens which connected togher with a navigation par .
and you can see who developed the app by cilcking here :
                ''',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return About_Us_Page();
                    }));
                  },
                  child: const Text(
                    'Developers',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
