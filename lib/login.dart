import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silverscreen/signup.dart';

import 'controller/authcontroller.dart';

class Login extends StatelessWidget {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  RxBool isobsecure = true.obs;
  AuthController controller = Get.find();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
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
                height: 420,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
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
                              'Log',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  letterSpacing: 3),
                            ),
                            Text(
                              'in',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  letterSpacing: 3),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: c1,
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                            prefixIcon: Icon(
                              Icons.email_outlined,
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
                        Obx(
                          () {
                            return TextField(
                              style: TextStyle(color: Colors.white),
                              controller: c2,
                              obscureText: isobsecure.value,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 2),
                                suffixIcon: IconButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    isobsecure.toggle();
                                  },
                                  icon: Icon(isobsecure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
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
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                            onPressed: () async {
                              String email = c1.text;
                              String pass = c2.text;
                              await controller.ulogin(email, pass);
                            },
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green,
                                side: BorderSide(
                                  color: Colors.green,
                                )),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontStyle: FontStyle.italic,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                'Dont have a account?',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(signup());
                                },
                                child: Text(
                                  ' Sign Up',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
