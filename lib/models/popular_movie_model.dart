class PopularMovieModel {
  final String backdrop_path;

  PopularMovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'];
}
