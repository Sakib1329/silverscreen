import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silverscreen/Moviedetails.dart';
import 'package:silverscreen/controller/movie_controller.dart';
import 'package:silverscreen/controller/tv_controller.dart';

class Search extends StatelessWidget {

  final Moviecontroller controller = Get.find();
  final TvController tvController=Get.find();

  Search({super.key});

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
            color: Colors.green,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Search Input Field
            Container(
              height: 50,
              child: TextField(
                onChanged: (query) async {
                  await controller.searchtvshows(query);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w200,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Search Results
            Expanded(
              child: Obx(
                    () => controller.isLoadingSearch.value
                    ? Center(
                  child: CircularProgressIndicator(color: Colors.green),
                )
                    : controller.searchdata.isEmpty
                    ? Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                  ),
                  itemCount: controller.searchdata.length,
                  itemBuilder: (context, index) {
                    final movie = controller.searchdata[index];
                    return Column(
                      children: [

                        GestureDetector(

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              movie.image,
                              fit: BoxFit.cover,
                              height: 250,
                            ),
                          ),
                          onTap: ()async{
                            await controller.moviedetail(movie.id);
                            Get.to(Moviedetails(),transition: Transition.rightToLeft);


                          },
                        ),
                        SizedBox(height: 5),
                        // Movie Title
                        Text(
                          movie.title,
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
