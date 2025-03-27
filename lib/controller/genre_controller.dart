import 'package:get/get.dart';
import 'package:silverscreen/model/genre_model.dart';
import 'package:silverscreen/services/genre_services.dart';

class Genrecontroller extends GetxController{



  final genre=<Genremodel>[].obs;
  RxString genrename='Categories'.obs;



  @override
  void onInit() {
  Genre();
    super.onInit();
  }


  Future Genre()async{

    try{
      final fetchedata= await Genreservices().fetchgnenre();
      if(fetchedata!=null) {
        genre.value = fetchedata;
      }
      else
        print('no  genre data found');
    }
    catch(e){
      print(e.toString());
    };

  }
}