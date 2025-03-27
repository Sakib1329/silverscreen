import 'dart:convert';

import 'package:silverscreen/constants/api_constants.dart';
import 'package:silverscreen/model/genre_model.dart';
import 'package:http/http.dart'as http;

class Genreservices{


  
 Future<List<Genremodel>?> fetchgnenre()async{
   
   final url=Uri.parse('${ApiConstants.baseUrl}/genre/movie/list?api_key=${ApiConstants.apiKey}');
   final response=await http.get(url);
   if(response.statusCode==200) {
     final data = jsonDecode(response.body);
     final jsondata = data['genres'] as List;

     return jsondata.map((json) => Genremodel.fromJson(json)).toList();
   }
   else
     print('Genre not fetchhed');
   
 } 
  
}