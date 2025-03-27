import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:silverscreen/controller/list_controller.dart';

class Mylist extends StatelessWidget {
  final Listcontroller listcontroller = Get.find();
   Mylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.green,
              size: 20,
            )),
        centerTitle: true,
        title: Text(
          'My List',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),

          Text('  Listed Movies',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            height: 300,
           
            child: Obx(()=>ListView.builder(itemBuilder: (context, index){
              final Lmovie=listcontroller.mymovielist;
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green,width: 1),
                    image: DecorationImage(image: NetworkImage(listcontroller.mymovielist[index]),fit: BoxFit.fill)
                ),
              );


            },
              scrollDirection: Axis.horizontal,
              itemCount: listcontroller.mymovielist.length,),),
          ),
          SizedBox(height: 10,),

          Text('  Listed Tv shows',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            height: 300,

            child: Obx(()=>ListView.builder(itemBuilder: (context, index){
              final Ltvshows=listcontroller.mytvlist;
              return Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green,width: 1),
                    image: DecorationImage(image: NetworkImage(listcontroller.mytvlist[index]),fit: BoxFit.fill)
                ),
              );


            },
              scrollDirection: Axis.horizontal,
              itemCount: listcontroller.mytvlist.length,),),
          ),
        ],
      )
    );
  }
}
