import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silverscreen/controller/authcontroller.dart';
import 'package:silverscreen/controller/bottom_sheet_controller.dart';

class Useraccount extends StatelessWidget {
  Useraccount({super.key});
  final BottomSheetController bs = Get.find();
  final AuthController controller = Get.find();
  RxBool enabled1 = false.obs;
  RxBool enabled2 = false.obs;
  final TextEditingController u1 = TextEditingController();
  final TextEditingController u2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.green[900],
            )),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                  onTap: () {
                    bs.getbottomsheet();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white24,
                    child: Obx(() => bs.pickedImagePath.value == ''
                        ? Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(bs.pickedImagePath.value),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          )),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      enabled1.toggle();
                    },
                    color: Colors.white,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green.shade900,
                    ),
                  )
                ],
              ),
              Obx(
                () => TextField(
                  controller: u1,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                      hintText: "${controller.userinfo.value['username']}",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabled: enabled1.value,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green.shade900,
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 4,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 4,
                          ))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Email',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      enabled2.toggle();
                    },
                    color: Colors.white,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green.shade900,
                    ),
                  )
                ],
              ),
              Obx(
                () => TextField(
                  controller: u2,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                      hintText: "${controller.userinfo.value['email']}",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabled: enabled2.value,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green.shade900,
                            width: 2,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 4,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 4,
                          ))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    controller.updatedata(u1.text, u2.text);
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      side: BorderSide(
                        color: Colors.green,
                      )),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
