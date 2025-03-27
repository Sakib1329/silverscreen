import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:silverscreen/main.dart';

import '../login.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<User?> fuser = Rx<User?>(null);
  var userinfo = {}.obs;
  RxBool isupdating=true.obs;

  @override
  void onReady() {
    super.onReady();


    fuser.bindStream(_auth.authStateChanges());
fuser.listen((user){
  if(user!=null){
    fetchdata();
  }
    });


  }



  Future<void> usignup(String uname, String uemail, String upass) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: uemail, password: upass);

      await _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'username': uname,
        'email': uemail,
        'uid': userCredential.user!.uid,
      });

      Get.snackbar('Congratulations', 'Account Created Successfully');
      Get.to(Login(),transition: Transition.rightToLeft);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> ulogin(String uemail, String upass) async {
    try {
      if (uemail.isNotEmpty && upass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: uemail, password: upass);

        Get.snackbar(
          "Congratulations",
          "Logged in Successfully",
          // Position it at the bottom
          backgroundColor: Colors.green, // Background color for success
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration for 3 seconds

          margin: EdgeInsets.all(10), // Add margin around the snackbar
        );
        Get.to(start(),transition: Transition.rightToLeft);
      } else if (uemail.isEmpty || upass.isEmpty) {
        if (uemail.isEmpty && upass.isNotEmpty) {
          Get.snackbar('Warning !', 'Please enter your email');
        } else if (upass.isEmpty && uemail.isNotEmpty) {
          Get.snackbar('Warning !', 'Please enter your password');
        } else {
          Get.snackbar('Warning !', 'Please enter your email and password');
        }
      }
    } catch (e) {
      // Show error message if something goes wrong
      Get.snackbar("Error", e.toString());
    }
  }

  // Method to log out the current user
  Future<void> logout() async {
    await _auth.signOut();
    Get.snackbar(
      'Logged Out Succesfully', 'You have been logged out',
      backgroundColor: Colors.green, // Background color for success
      colorText: Colors.white, // Text color
      duration: Duration(seconds: 3), // Duration for 3 seconds

      margin: EdgeInsets.all(10),
    );
    Get.to(Login(),transition: Transition.rightToLeft);
  }

  Future<void> fetchdata() async {
    if (fuser.value != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('Users').doc(fuser.value!.uid).get();
     if(snapshot.exists){ userinfo.value = {
        'username': snapshot['username'],
        'email': snapshot['email'],
      };

     }
     else{
       print('user data not found');

    }
    }
  }
  Future<void>updatedata(String updatedname,String updatedemail)async{
    try {
      if (_auth.currentUser != null) {
        String uid = _auth.currentUser!.uid;
        DocumentReference docref = await _firestore.collection('Users').doc(
            uid);
        await docref.update({
          'username': updatedname,
          'email': updatedemail,
        }

        );
        await fetchdata();
        Get.snackbar(
          "Succes",
          "User information updated",

          backgroundColor: Colors.green, // Background color for success
          colorText: Colors.white, // Text color
          duration: Duration(seconds: 3), // Duration for 3 seconds

          margin: EdgeInsets.all(10), // Add margin around the snackbar
        );
      }
    }catch(e){
      Get.snackbar(
        "Error",
        "Failed to update data. Please try again.",
        // Position it at the bottom
        backgroundColor: Colors.green, // Background color for success
        colorText: Colors.white, // Text color
        duration: Duration(seconds: 3), // Duration for 3 seconds

        margin: EdgeInsets.all(10), // Add margin around the snackbar
      );


    }
    finally {
      isupdating.value = false;
    };
    }

}
