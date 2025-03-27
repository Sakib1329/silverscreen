
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:silverscreen/Homepage.dart';
import 'package:silverscreen/controller/authcontroller.dart';
import 'package:silverscreen/controller/bottom_sheet_controller.dart';
import 'package:silverscreen/controller/genre_controller.dart';
import 'package:silverscreen/controller/list_controller.dart';
import 'package:silverscreen/controller/movie_controller.dart';
import 'package:silverscreen/controller/nav_controller.dart';
import 'package:silverscreen/controller/tv_controller.dart';
import 'package:silverscreen/login.dart';
import 'package:silverscreen/profile.dart';
import 'package:silverscreen/services/Tv_services.dart';
import 'package:silverscreen/services/movie_services.dart';
import 'package:silverscreen/splashscreen.dart';
import 'package:silverscreen/tvshows.dart';

import 'movie.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController()); // Auth Controller
  Get.put(BottomSheetController()); // Bottom Sheet Controller
  Get.put(Navigation());
  Get.put(Moviecontroller());
  Get.put(Genrecontroller());
  Get.put(Listcontroller());
  Get.put(MovieServices());
  Get.put(TvController());
  Get.put(TvServices());



  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: start(),
    );
  }
}


class start extends StatelessWidget {
  start({super.key});


  final Navigation navcontroller=Get.put(Navigation());
  final screens=[
    Homepage(),
    Movie(),
    Tvshows(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Obx(() =>CurvedNavigationBar(
        index: navcontroller.currentindex.value,
        items: navcontroller.items,
        onTap: (index){
          navcontroller.currentindex.value=index;
        },
        color: Colors.grey.shade600,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.greenAccent.shade700,
        height: 70,
      ),),
      body: Obx(()=>screens[navcontroller.currentindex.value]),
    );
  }
}
