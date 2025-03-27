import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:silverscreen/controller/movie_controller.dart';

class Moviedetails extends StatelessWidget {
  final Moviecontroller controller = Get.find();

  Moviedetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Obx(() {
          final details = controller.moviedetails.value;
          if (details == null) {
            return CircularProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    width: 390,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(details.image), fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${details.title}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        details.releasedate,
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        '    ${(details.runtime / 60).floor()}h ${details.runtime % 60}min',
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        '   Ratings ',
                        style: TextStyle(color: Colors.white54),
                      ),
                      RatingBarIndicator(
                        itemCount: 5,
                        rating: details.rating / 2,
                        itemSize: 18,
                        unratedColor: Colors.white,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          ' ${(details.rating.toStringAsFixed(1))}',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(itemBuilder: (context,index){
                     return Container(
margin: EdgeInsets.only(right: 8),
padding: EdgeInsets.only(top: 5,bottom: 5,left: 8,right: 8),
                         decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
                           border: Border.all(
                             color: Colors.white24
                           )

                         ),

                         
                         child: Text(details.genres[index],style: TextStyle(color: Colors.white70,fontSize: 12),));

                    },
                      scrollDirection: Axis.horizontal,
                    itemCount: details.genres.length,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'PLAY',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${details.overview}',
                    style: TextStyle(color: Colors.white54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Cast',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Member',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 150,
                  child: ListView.builder(itemBuilder: (context,index){
                    final castdata= controller.cast[index];

                    return
                      castdata.image.isNotEmpty
                      ?Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                            height: 100,
                              width: 100,
                              decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: NetworkImage(castdata.image),fit: BoxFit.fill)
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(castdata.name,style: TextStyle(color: Colors.white70),)
                          ],
                        ),
                      )
                          :CircleAvatar(child: Icon(Icons.person),);

                  },
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cast.length,
                  ),
                ),
                  Row(


                    children: [
                      Text(
                        'Similar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Movies',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  controller.similar.isNotEmpty
                      ? SizedBox(
                          height: 400,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 5,
                                    mainAxisExtent: 200),
                            itemBuilder: (context, index) {
                              final similardata = controller.similar[index];
                              return GestureDetector(
                                onTap: () async {
                                  await controller.moviedetail(similardata.id);
                                  print(similardata.id);
                                  Get.to(Moviedetails());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            similardata.image,
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                            itemCount: controller.similar.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        )
                      : Container(
                          color: Colors.white12,
                          child: SizedBox(
                            child: Center(
                              child: Text(
                                'No similar Movies',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          height: 100,
                        ),
                ],
              ),
            );
          }
        }));
  }
}
