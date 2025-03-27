
class CastModel {
  final int id;
  final String name;

  final String image;


  CastModel(
      {

        required this.id,
        required this.name,

        required this.image,

      });


  factory CastModel.fromJson(Map<String,dynamic>json){
    return CastModel(
      id: json['id'],
      name: json['name'],

      image:  json['profile_path'] != null
          ? 'https://image.tmdb.org/t/p/original${json['profile_path']}'
          : 'https://via.placeholder.com/200x300',

    );


  }




}