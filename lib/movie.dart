import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:silverscreen/Moviedetails.dart';
import 'package:silverscreen/Search.dart';
import 'package:silverscreen/controller/genre_controller.dart';
import 'package:silverscreen/controller/list_controller.dart';
import 'package:silverscreen/controller/movie_controller.dart';

import 'package:silverscreen/model/genre_model.dart';
import 'package:silverscreen/services/movie_services.dart';

class Movie extends StatelessWidget {
  final Moviecontroller controller = Get.find();
  final Genrecontroller genrecontroller = Get.find();
  final Listcontroller listcontroller = Get.find();
  final MovieServices movieServices=Get.find();


  Movie({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          leading: Icon(
            Icons.movie_creation_outlined,
            color: Colors.green,
            size: 30,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mo',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
              Text(
                'vies',
                style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {

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
              controller.genredata.value=value.gid;
                await controller.fetchPopularmovies();
                await controller.fetchtopratedmovies();
                await controller.fetchupcoming();
                await controller.fetchnowplaying();

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
                    final Pmovie = controller.popularmovies[index];
                    if (controller.isloading == false) {
                      return Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 360,
                                height: 420,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.transparent, width: 1),
                                  image: DecorationImage(
                                      image: NetworkImage(Pmovie.image),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              onTap: ()async{
                                  await controller.moviedetail(Pmovie.id);
                                  await controller.similarmovie(Pmovie.id);
                                  await controller.CastMembers(Pmovie.id);
                                Get.to(Moviedetails(),transition: Transition.rightToLeft);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                    onPressed: ()  async{

                                      await controller.moviedetail(Pmovie.id);

                                      Get.to(Moviedetails());

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
            listcontroller.getselectedmovie(Pmovie.image);
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
                  itemCount: controller.popularmovies.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '   Now Streaming',
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
                    final Nmovie = controller.Nowplaying[index];

                    if (controller.isLoadingN == false) {
                      return GestureDetector(
                        onTap: ()async{
                          await controller.moviedetail(Nmovie.id);
                          Get.to(Moviedetails());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(Nmovie.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: controller.Nowplaying.length,
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
                    final tmovie = controller.topratedmovies[index];
                    print(tmovie);
                    if (controller.isloadingT == false) {
                      return GestureDetector(
                        onTap: ()async{
                          await controller.moviedetail(tmovie.id);
                          Get.to(Moviedetails());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(tmovie.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: controller.topratedmovies.length,
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
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    final pmovie = controller.popularmovies[index];

                    if (controller.isloading == false) {
                      return GestureDetector(
                        onTap: ()async{
                          await controller.moviedetail(pmovie.id);
                          Get.to(Moviedetails());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(pmovie.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: controller.popularmovies.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '   Upcoming Movies',
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
                    final umovie = controller.upcomingMovies[index];

                    if (controller.isLoadingU == false) {
                      return GestureDetector(
                        onTap: ()async{
                          await controller.moviedetail(umovie.id);
                          Get.to(Moviedetails());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(umovie.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  itemCount: controller.upcomingMovies.length,
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
