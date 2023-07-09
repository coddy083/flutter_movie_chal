class MovieDetailModel {
  final int runtime;
  final String title;
  final List<Map<String, dynamic>> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : runtime = json['runtime'],
        title = json['title'],
        genres = json['genres'].cast<Map<String, dynamic>>().toList();
}
