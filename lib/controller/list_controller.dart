import 'package:get/get.dart';

class Listcontroller extends GetxController{

  final mymovielist = <String>[].obs;
  final mytvlist = <String>[].obs;

getselectedmovie(String image){

mymovielist.add(image);


}
  getselectedtvshows(String image){

    mytvlist.add(image);


  }



}