class ComingSoonMovieModel {
  final String backdrop_path, title;

  ComingSoonMovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        title = json['title'];
}
