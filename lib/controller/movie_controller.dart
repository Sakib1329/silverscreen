import 'package:get/get.dart';
import 'package:silverscreen/model/cast_model.dart';
import 'package:silverscreen/model/details_model.dart';
import 'package:silverscreen/model/movie_model.dart';
import 'package:silverscreen/services/movie_services.dart';


class Moviecontroller extends GetxController{

final popularmovies=<Moviemodel>[].obs;
final cast=<CastModel>[].obs;
final similar=<Moviemodel>[].obs;
final topratedmovies=<Moviemodel>[].obs;
final upcomingMovies=<Moviemodel>[].obs;
final Nowplaying=<Moviemodel>[].obs;
final searchdata=<Moviemodel>[].obs;
final moviedetails=Rxn<DetailsModel>();

final isloading=false.obs;
final isloadingD=false.obs;
final isloadingT=false.obs;
final isLoadingU=false.obs;
final isLoadingN=false.obs;
final isLoadingS=false.obs;
final isLoadingSearch=false.obs;
final genredata=0.obs;


@override
void onInit() {
  super.onInit();
  fetchPopularmovies();
  fetchtopratedmovies();
  fetchupcoming();
  fetchnowplaying();

}
Future searchtvshows(String query)async{
  isLoadingSearch(true);
  try {
    final fetchedsearchedmovies=await MovieServices().fetchmoviesbysearch(query);

    if(fetchedsearchedmovies!=null){
searchdata.value=fetchedsearchedmovies;

    }
  }
  catch(e){

    print(e.toString());
  }
  finally{

    isLoadingSearch(false);
  }


}


Future CastMembers(int id)async{
  try {
    isLoadingS(true);

    final fetchedmovies = await MovieServices().fetchcast(id);
    print(fetchedmovies);
    if(fetchedmovies!=null){
      cast.value=fetchedmovies;
    }
    else
      print('no similar data found');
  }
  catch(e){
    print(e.toString());
  }
  finally{
    isLoadingS(false);
  }
}


Future similarmovie(int id)async{
  try {
    isLoadingS(true);
    final fetchedmovies = await MovieServices().fetchdsimilarMovies(id);
    print(fetchedmovies);
    if(fetchedmovies!=null){
      similar.value=fetchedmovies;
    }
    else
      print('no similar data found');
  }
  catch(e){
    print(e.toString());
  }
  finally{
    isLoadingS(false);
  }
}

Future moviedetail(int id)async{
  try {
    isloadingD(true);
    similar.clear();
    cast.clear();
    CastMembers(id);
similarmovie(id);
    final fetchedmovies = await MovieServices().fetchdetailMovies(id);
    print(fetchedmovies);
    if(fetchedmovies!=null)
      moviedetails.value=fetchedmovies;
    else
      print('no data found');
  }
  catch(e){
    print(e.toString());
  }
  finally{
    isloadingD(false);
  }
}

Future fetchPopularmovies()async{
  try {
    isloading(true);
    final fetchedmovies = await MovieServices().fetchpmovies(genredata.value);
    if(fetchedmovies!=null)
    popularmovies.value=fetchedmovies;
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
Future fetchtopratedmovies()async{
  try {
    isloadingT(true);
    final fetchedtmovies = await MovieServices().fetchtmovies(genredata.value);
    if (fetchedtmovies != null) {
      topratedmovies.value = fetchedtmovies;
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

Future fetchupcoming()async{
  try{
    isLoadingU(true);
    final fetchedupcoming=await MovieServices().fetchupcomingMovies(genredata.value);
    if(fetchedupcoming!=null){
    upcomingMovies.value=fetchedupcoming;}
    else{
      print('upcoming data not found');
    }


  }
  catch(e){
    print(e.toString());
  }
  finally{
    isLoadingU(false);
  }

}

Future fetchnowplaying()async{
  try{
    isLoadingN(true);
    final fetchednowplaying=await MovieServices().fetchunowMovies(genredata.value);
    if(fetchednowplaying!=null){
      Nowplaying.value=fetchednowplaying;}
    else{
      print('upcoming data not found');
    }


  }
  catch(e){
    print(e.toString());
  }
  finally{
    isLoadingN(false);
  }

}
}