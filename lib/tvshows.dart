import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:silverscreen/Search.dart';
import 'package:silverscreen/controller/genre_controller.dart';
import 'package:silverscreen/controller/list_controller.dart';

import 'package:silverscreen/controller/tv_controller.dart';

import 'package:silverscreen/model/genre_model.dart';
import 'package:silverscreen/services/Tv_services.dart';


class Tvshows extends StatelessWidget {
  final TvController tvController = Get.find();
  final Genrecontroller genrecontroller = Get.find();
  final Listcontroller listcontroller = Get.find();
  final TvServices tvServices=Get.find();
  final TextEditingController T1=TextEditingController();

  Tvshows({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tv ',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
              Text(
                'Shows',
                style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
              ),

            ],
          ),
          leading: Icon(
            Icons.movie_creation_outlined,
            color: Colors.green,
            size: 30,
          ),
          actions: [
            IconButton(
                onPressed: () async{

                Get.to(Search(),transition: Transition.rightToLeft);

                },
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.green,
                  size: 30,
                ))
          ],
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            Obx(
                  () => DropdownButton<Genremodel>(
                items: genrecontroller.genre.map((Genremodel genre) {
                  return DropdownMenuItem<Genremodel>(
                    value: genre,
                    child: Text(genre.gname,
                        style: TextStyle(
                            color: Colors.white, fontSize: 20,letterSpacing: 1,fontWeight: FontWeight.bold)),
                    alignment: Alignment.center,
                  );

                }).toList(),
                menuMaxHeight: 680,
                alignment: Alignment.centerRight,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green,
                ),
                onChanged: (value)async {
                  if(value!=null){
                    genrecontroller.genrename.value = value.gname;
                    tvController.genredata.value=value.gid;
                 await tvController.fetchtoprated();
                 await tvController.fetchPopulartv();
                 await tvController.fetchonetheair();
                 await tvController.fetchairtoday();

                  }
                },
                underline: SizedBox(),
                hint: Text('${genrecontroller.genrename.value} ',
                    style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold)),
                dropdownColor: Colors.black87,

              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 495,
              child: Obx(
                    () => ListView.builder(
                  itemBuilder: (context, index) {
                    final Ptvshows = tvController.populartvshows[index];
                    if (tvController.isloading == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 360,
                              height: 420,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.transparent, width: 1),
                                image: DecorationImage(
                                    image: NetworkImage(Ptvshows.image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                    onPressed: ()  {


                                    },
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white12,
                                        side: BorderSide(
                                          color: Colors.green,
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.green,
                                          size: 30,
                                        ),
                                        Text(
                                          'Play ',
                                          style: TextStyle(
                                            letterSpacing: 2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 19,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 40,
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      listcontroller.getselectedtvshows(Ptvshows.image);
                                      Get.snackbar('Success', 'Added to MyList',duration: Duration(seconds: 2),
                                        colorText: Colors.white,
                                        backgroundColor: Colors.green,
                                        snackPosition: SnackPosition.BOTTOM,
                                        icon: Icon(Icons.check, color: Colors.white),
                                        snackStyle: SnackStyle.FLOATING,


                                      );

                                    },
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white12,
                                        side: BorderSide(
                                          color: Colors.green,
                                          width: 2,
                                        )),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.green,
                                          size: 30,
                                        ),
                                        Text(
                                          'MyList',
                                          style: TextStyle(
                                            letterSpacing: 2,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 19,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: tvController.populartvshows.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '   Airing Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: Obx(
                    () => ListView.builder(
                  itemBuilder: (context, index) {
                    final ATvshows = tvController.airtodaytvshows[index];

                    if (tvController.isLoadinga == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 7),
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(ATvshows.image),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: tvController.airtodaytvshows.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '   Top Rated Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: Obx(
                    () => ListView.builder(
                  itemBuilder: (context, index) {
                    final Ttvshows = tvController.topratedtvshows[index];

                    if (tvController.isloadingT == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 7),
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(Ttvshows.image),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: tvController.topratedtvshows.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '   Popular Movies ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 150,
              child: Obx(
                    () => ListView.builder(
                  itemBuilder: (context, index) {
                    final pmovie = tvController.populartvshows[index];

                    if (tvController.isloading == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 7),
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(pmovie.image),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: tvController.populartvshows.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),

            Text(
              '  On the air Tvshows',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: Obx(
                    () => ListView.builder(
                  itemBuilder: (context, index) {
                    final otvshows = tvController.ontheairtvshows[index];

                    if (tvController.isLoadingo == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 7),
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(otvshows.image),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: tvController.ontheairtvshows.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
