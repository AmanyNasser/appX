//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  String email = "";
  String password = "";

  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';

    setState(() {});
  }

  getCachedPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('Password') ?? '*********';

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCachedEmail();
    getCachedPassword();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(" your profile"),
          actions: [
            IconButton(
                onPressed: () {
                  print("Theres No notification");
                },
                icon: Icon(Icons.notifications)),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"))),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white,
                                  ),
                                  color: Colors.blue),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Center(child: Text("$email \n ")),

                  TextFormField(
                    initialValue: "mohammed nagib",
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 222, 216, 208),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.only(top: 10),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 242, 171, 78),
                      ),
                      labelText: " Your Name",
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text("Your password: \n  "),
                  TextFormField(
                    initialValue: "************",
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 222, 216, 208),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.only(top: 5),
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 242, 171, 78),
                      ),
                      labelText: "password",
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text("Your Mobile Number: \n  "),
                  TextFormField(
                    initialValue: "01234567891",
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 222, 216, 208),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.only(top: 5),
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        color: Color.fromARGB(255, 242, 171, 78),
                      ),
                      labelText: "Phone number",
                    ),
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: "Mansora",
                    readOnly: true,
                    cursorColor: Color.fromARGB(255, 222, 216, 208),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 222, 216, 208),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.only(top: 5),
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: Color.fromARGB(255, 242, 171, 78),
                      ),
                      labelText: " Your City",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
