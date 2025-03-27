import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:silverscreen/constants/api_constants.dart';
import 'package:silverscreen/model/cast_model.dart';
import 'package:silverscreen/model/details_model.dart';
import 'package:silverscreen/model/movie_model.dart';




class MovieServices {

  Future<List<Moviemodel>?> fetchmoviesbysearch(String querydata)async{
    final url=Uri.parse('${ApiConstants.baseUrl}/search/movie?api_key=${ApiConstants
        .apiKey}&query=$querydata');
    final response=await http.get(url);

    if(response.statusCode==200) {
      final data = jsonDecode(response.body);
      final jsondata=data['results'] as List;
      print(jsondata);
      return jsondata.map((json)=> Moviemodel.fromJson(json)).toList();
    }
    else
    {
      print('fetching Search incomplete  ');
      return null;
    }

  }



  Future<List<Moviemodel>?> fetchpmovies(int genredata) async {
   final response;


    try {
      if(genredata==0){
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/movie/popular?api_key=${ApiConstants
                .apiKey}&page=1');
         response = await http.get(url);

      }
      else{
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/movie?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=popularity.desc');


        print(genredata);
        response = await http.get(url);

      }


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
         return jsondata.map((json) => Moviemodel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<Moviemodel>?> fetchtmovies(int genredata)async{
    final response;


    try {
      if (genredata == 0) {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/movie/top_rated?api_key=${ApiConstants
                .apiKey}&page=1');
        response = await http.get(url);
      }
      else {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/movie?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=vote_average.desc');

        response = await http.get(url);
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => Moviemodel.fromJson(json)).toList();
      }
      else {
        throw Exception(
            'Failed to load top rated movies. Status code: ${response
                .statusCode}');
      }
    }
    catch(e){
      print(e.toString());
    }
      
    }
    Future <List<Moviemodel>?> fetchupcomingMovies(int genredata)async{
      final response;


      try {
        if (genredata == 0) {
          final url = Uri.parse(
              '${ApiConstants.baseUrl}/movie/upcoming?api_key=${ApiConstants
                  .apiKey}&page=1');
          response = await http.get(url);
        }
        else {
          final url = Uri.parse(
              '${ApiConstants.baseUrl}/discover/movie?api_key=${ApiConstants
                  .apiKey}&with_genres=${genredata}&sort_by=release_date.desc&page=5');

          response = await http.get(url);
        }

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final jsondata = data['results'] as List;
          return jsondata.map((json) => Moviemodel.fromJson(json)).toList();
        }
        else {
          throw Exception(
              'Failed to load top rated movies. Status code: ${response
                  .statusCode}');
        }
      }
      catch(e){
        print(e.toString());
      }

    }
  Future <List<Moviemodel>?> fetchunowMovies(int genredata)async{
    final response;


    try {
      if (genredata == 0) {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/movie/now_playing?api_key=${ApiConstants
                .apiKey}&page=1');
        response = await http.get(url);
      }
      else {
        final url = Uri.parse(
            '${ApiConstants.baseUrl}/discover/movie?api_key=${ApiConstants
                .apiKey}&with_genres=${genredata}&sort_by=release_date.desc&page=4');

        response = await http.get(url);
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsondata = data['results'] as List;
        return jsondata.map((json) => Moviemodel.fromJson(json)).toList();
      }
      else {
        throw Exception(
            'Failed to load top rated movies. Status code: ${response
                .statusCode}');
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  Future <DetailsModel?> fetchdetailMovies(int id)async{
   final url=Uri.parse('${ApiConstants.baseUrl}/movie/${id}?api_key=${ApiConstants
       .apiKey}');
   final response=await http.get(url);
   print(response.statusCode);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
       return DetailsModel.fromJson(data);
      }
      else {
        throw Exception(
            'Failed to load top rated movies. Status code: ${response
                .statusCode}');
      }
    }

  Future <List<Moviemodel>?> fetchdsimilarMovies(int id)async{
    final url=Uri.parse('${ApiConstants.baseUrl}/movie/${id}/similar?api_key=${ApiConstants
        .apiKey}');
    final response=await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final jsondata=data['results'] as List;
      print(jsondata);
      return jsondata.map((json)=> Moviemodel.fromJson(json)).toList();
    }
    else {
      throw Exception(
          'Failed to load top rated movies. Status code: ${response
              .statusCode}');
    }
  }


  Future <List<CastModel>?> fetchcast(int id)async{
    final url=Uri.parse('${ApiConstants.baseUrl}/movie/${id}/credits?api_key=${ApiConstants
        .apiKey}');
    final response=await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final jsondata=data['cast'] as List;
      print(jsondata);
      return jsondata.map((json)=> CastModel.fromJson(json)).toList();
    }
    else {
      throw Exception(
          'Failed to load top rated movies. Status code: ${response
              .statusCode}');
    }
  }




  }


