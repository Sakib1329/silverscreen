import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:silverscreen/controller/authcontroller.dart';
import 'package:silverscreen/controller/bottom_sheet_controller.dart';
import 'package:silverscreen/mylist.dart';
import 'package:silverscreen/useraccount.dart';
class Profile extends StatelessWidget {
  Profile({super.key});

final AuthController controller=Get.find();
final BottomSheetController bs=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Material(
        color: Colors.black,
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CircleAvatar(
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
        ),
            SizedBox(height: 15,),
            Obx(()=>Text("${controller.userinfo.value['username']}",style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 3),),),
        SizedBox(height: 15,),
            ListTile(
              onTap: (){
Get.to(Useraccount(),transition: Transition.rightToLeft);
              },
              leading: Icon(Icons.person,),
              splashColor: Colors.green[900],
              title: Text('Account',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
                Get.to(Mylist(),transition: Transition.rightToLeft);
              },
              leading: Icon(Icons.list,),
              splashColor: Colors.green[900],
              title: Text('My List',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
              },
              leading: Icon(Icons.bookmark_added_outlined,),
              splashColor: Colors.green[900],
              title: Text('Watchlist',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
              },
              leading: Icon(Icons.history,),
              splashColor: Colors.green[900],
              title: Text('Recently Watched',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
              },
              splashColor: Colors.green[900],
              selectedTileColor: Colors.white10,
              leading: Icon(Icons.settings,),
              title: Text('Settings',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
              },
              splashColor: Colors.green[900],
              selectedTileColor: Colors.white10,
              leading: Icon(Icons.help,),
              title: Text('Help',style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
              iconColor: Colors.green,
            ),
            SizedBox(height: 10,),
        ListTile(
          onTap: () {
            controller.logout();
          },
          leading: Icon(Icons.logout),
          title: Text('Sign Out', style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white24,),
          splashColor: Colors.green[900],
          selectedTileColor: Colors.white10,
          iconColor: Colors.green,
        )



          ],
        ),
      )

    );
  }
}
