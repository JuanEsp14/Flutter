class Actores{
  List<Actor> actores = new List<Actor>();

  Actores();
  Actores.fromJSONList(List<dynamic> jsonList ){
    if(jsonList == null) return;

    for (var item in jsonList) {
      final actor = new Actor.fromJsonMap(item);
      actores.add(actor);      
    }
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){
    //Los double deben dividir por 1 para asegurarse de si viene un número entero este sea convertivo en double
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getActorImg(){
    if(profilePath == null ) return 'https://vyshnevyi-partners.com/wp-content/uploads/2016/12/no-avatar-300x300.png';
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
