
class DetailsModel {
  final int id;
  final String title;
  final String overview;
  final String image;
  final List<String> genres;
  final String releasedate;
  final double rating;
  final int runtime;


  DetailsModel(
      {

        required this.id,
        required this.title,
        required this.overview,
        required this.image,
        required this.genres,
        required this.rating,
        required  this.releasedate,
        required this.runtime,

      });


  factory DetailsModel.fromJson(Map<String,dynamic>json){
    List<String> genreList = (json['genres'] as List)
        .map((genre) => genre['name'].toString())
        .toList();
    return DetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      genres: genreList,
      rating: json['vote_average'],
      releasedate: json['release_date'],
      runtime: json['runtime'],


      image:  json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/original${json['poster_path']}'
          : 'https://via.placeholder.com/200x300',

    );


  }




}