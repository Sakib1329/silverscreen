import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:silverscreen/controller/authcontroller.dart';

class signup extends StatelessWidget {
  final s1 = TextEditingController();
  final s2 = TextEditingController();
  final s3 = TextEditingController();
  AuthController controller = Get.find();

  signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img2.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 450,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                letterSpacing: 3),
                          ),
                          Text(
                            ' Up',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                letterSpacing: 3),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: s1,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w200),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 3,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: s2,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w200),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: s3,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w200),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 3,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      OutlinedButton(
                          onPressed: () async {
                            String username = s1.text;
                            String email = s2.text;
                            String pass = s3.text;
                            await controller.usignup(username, email, pass);
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.green,
                              side: BorderSide(
                                color: Colors.green,
                              )),
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
