import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetController extends GetxController{
  final ImagePicker picker=ImagePicker();
  var pickedImagePath = ''.obs;


  void getbottomsheet (){

    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(20),
        height: 150,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(30),
          color: Colors.white12,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()async{
                  final pickedfile=await picker.pickImage(source: ImageSource.camera);
                  if(pickedfile!=null){
                    pickedImagePath.value=pickedfile.path;
                  }

                }, icon: Icon(Icons.camera_alt,size: 50,color: Colors.green,)),
                Text('Camera',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()async{
                  final pickedfile=await picker.pickImage(source: ImageSource.gallery);
                  if(pickedfile!=null){
                    pickedImagePath.value=pickedfile.path;
                  }

                }, icon: Icon(Icons.photo_library_rounded,size: 50,color: Colors.green,)),
                Text('Gallery',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),

          ],
        ),
      ),
    );

  }


}