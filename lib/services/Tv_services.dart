import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:silverscreen/constants/api_constants.dart';

import 'package:silverscreen/model/tv_model.dart';




class TvServices {



  Future<List<TvModel>?> fetchptvshows(int genredata) async {
    final response;


    try {
      if(genredata==0){
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/tv/popular?api_key=${ApiConstants
                .apiKey}&page=1');
        response = await http.get(url);

      }
      else{
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/tv?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=popularity.desc');


        print(genredata);
        response = await http.get(url);

      }


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => TvModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load popular tvshows. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<TvModel>?> fetchtoptvshows(int genredata)async{
    final response;


    try {
      if (genredata == 0) {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/tv/top_rated?api_key=${ApiConstants
                .apiKey}&page=5');
        response = await http.get(url);
      }
      else {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/tv?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=vote_average.desc');

        response = await http.get(url);
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => TvModel.fromJson(json)).toList();
      }
      else {
        throw Exception(
            'Failed to load top rated tvshows. Status code: ${response
                .statusCode}');
      }
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }
  Future <List<TvModel>?> fetchontheairtvshows(int genredata)async{
    final response;


    try {
      if (genredata == 0) {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/tv/on_the_air?api_key=${ApiConstants
                .apiKey}&page=8');
        response = await http.get(url);
      }
      else {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/tv?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=release_date.desc&page=5');

        response = await http.get(url);
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => TvModel.fromJson(json)).toList();
      }
      else {
        throw Exception(
            'Failed to load top rated tvshows. Status code: ${response
                .statusCode}');
      }
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }
  Future <List<TvModel>?> fetchairtodaytvshows(int genredata)async{
    final response;


    try {
      if (genredata == 0) {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/tv/airing_today?api_key=${ApiConstants
                .apiKey}&page=1');
        response = await http.get(url);
      }
      else {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/tv?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=release_date.desc&page=4');

        response = await http.get(url);
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => TvModel.fromJson(json)).toList();
      }
      else {
        throw Exception(
            'Failed to load top rated tvshows. Status code: ${response
                .statusCode}');
      }
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

Future<List<TvModel>?> fetchtvshowsbysearch(String querydata)async{
    final url=Uri.parse('${ApiConstants.baseUrl}/search/tv?api_key=${ApiConstants
        .apiKey}&query=$querydata');
    final response=await http.get(url);
    if(response.statusCode==200) {
      final data = jsonDecode(response.body);
      final jsondata=data['results'] as List;
      return jsondata.map((json)=> TvModel.fromJson(json)).toList();
    }
    else
      {
        print('fetching Search incomplete  ');
        return null;
      }

}



}


