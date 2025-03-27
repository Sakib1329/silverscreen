
class TvModel {
  final int id;
  final String name;
  final String overview;
  final String image;


  TvModel(
      {

        required this.id,
        required this.name,
        required this.overview,
        required this.image,

      });


  factory TvModel.fromJson(Map<String,dynamic>json){
    return TvModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      image:  json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/original${json['poster_path']}'
          : 'https://via.placeholder.com/200x300',

    );


  }




}