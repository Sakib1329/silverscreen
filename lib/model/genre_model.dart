import 'package:flutter/foundation.dart';

class Genremodel{

   final int gid;
  final String gname;

Genremodel( {

     required this.gid,
  required this.gname,

});


factory Genremodel.fromJson(Map<String,dynamic>json){
   return Genremodel(
       gid: json['id'],
       gname: json['name']);
}

}