class NowInCinemaModel {
  final String backdrop_path, title;

  NowInCinemaModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        title = json['title'];
}
