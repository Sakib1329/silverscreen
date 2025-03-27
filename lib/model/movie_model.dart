
class Moviemodel {
  final int id;
  final String title;
  final String overview;
  final String image;


  Moviemodel(
      {

        required this.id,
        required this.title,
        required this.overview,
        required this.image,

      });


  factory Moviemodel.fromJson(Map<String,dynamic>json){
    return Moviemodel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      image:  json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/original${json['poster_path']}'
          : 'https://via.placeholder.com/200x300',

    );


  }




}