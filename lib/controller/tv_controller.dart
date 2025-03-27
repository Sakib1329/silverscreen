import 'package:get/get.dart';
import 'package:silverscreen/model/tv_model.dart';
import 'package:silverscreen/services/Tv_services.dart';



class TvController extends GetxController{

  final populartvshows=<TvModel>[].obs;
  final topratedtvshows=<TvModel>[].obs;
  final ontheairtvshows=<TvModel>[].obs;
  final airtodaytvshows=<TvModel>[].obs;

  final isloading=false.obs;
  final isloadingT=false.obs;
  final isLoadingo=false.obs;
  final isLoadinga=false.obs;
  final isloadingS=false.obs;
  final genredata=0.obs;
  RxString querydata=''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPopulartv();
    fetchtoprated();
    fetchairtoday();
    fetchonetheair();

  }

  Future searchtvshows()async{
    isloadingS(true);
    try {
      await TvServices().fetchtvshowsbysearch(querydata.value);
    }
    catch(e){

      print(e.toString());
    }
finally{

      isloadingS(false);
}


  }

  Future fetchPopulartv()async{
    try {
      isloading(true);
      final  fetchedtvshows = await TvServices().fetchptvshows(genredata.value);
      if( fetchedtvshows!=null)
        populartvshows.value= fetchedtvshows;
      else
        print('no data found');
    }
    catch(e){
      print(e.toString());
    }
    finally{
      isloading(false);
    }
  }
  Future fetchtoprated()async{
    try {
      isloadingT(true);
      final  fetchedtvshows = await TvServices().fetchtoptvshows(genredata.value);
      if ( fetchedtvshows != null) {
        topratedtvshows.value =  fetchedtvshows;
      }
      else {
        print('Top rated data not found');
      }
    }
    catch(e){
      print(e.toString());
    }
    finally{
      isloadingT(false);
    }

  }

  Future fetchonetheair()async{
    try{
      isLoadingo(true);
      final  fetchedtvshows=await TvServices().fetchontheairtvshows(genredata.value);
      if( fetchedtvshows!=null){
        ontheairtvshows.value= fetchedtvshows;}
      else{
        print('upcoming data not found');
      }


    }
    catch(e){
      print(e.toString());
    }
    finally{
      isLoadingo(false);
    }

  }

  Future fetchairtoday()async{
    try{
      isLoadinga(true);
      final fetchedtvshows=await TvServices().fetchairtodaytvshows(genredata.value);
      if( fetchedtvshows!=null){
        airtodaytvshows.value= fetchedtvshows;}
      else{
        print('upcoming data not found');
      }


    }
    catch(e){
      print(e.toString());
    }
    finally{
      isLoadinga(false);
    }

  }
}