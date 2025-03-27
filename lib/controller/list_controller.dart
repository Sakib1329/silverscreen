import 'package:get/get.dart';

class Listcontroller extends GetxController{

  final mymovielist = <String>[].obs;

getselectedmovie(String image){

mymovielist.add(image);


}


}