import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends GetxController{
  var currentindex=0.obs;


  List<Widget> get items=> [

    currentindex.value==0
        ? Icon(Icons.home,color: Colors.black,size: 30,)
        :Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Icon(Icons.home,color: Colors.black,size: 30,),
        Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    ),

    currentindex.value==1
    ? Icon(Icons.movie,color: Colors.black,size: 30,)
        :Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Icon(Icons.movie,color: Colors.black,size: 30,),
        Text('Movie',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    ),
    currentindex.value==2
    ?Icon(Icons.tv_rounded,color: Colors.black,size: 30,)
    :Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Icon(Icons.tv_rounded,color: Colors.black,size: 30,),
        Text('Tv Shows',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    ),
    currentindex.value==3
    ?Icon(Icons.person,color: Colors.black,size: 30,)
    :Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Icon(Icons.person,color: Colors.black,size: 30,),
        Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    ),



  ];
}