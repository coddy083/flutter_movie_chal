class MovieModel {
  final String backdrop_path, poster_path, title, overview;
  final int id;
  final double vote_average;

  MovieModel.fromJson(Map<String, dynamic> json)
      : backdrop_path = json['backdrop_path'],
        poster_path = json['poster_path'],
        id = json['id'],
        title = json['title'],
        overview = json['overview'],
        vote_average = json['vote_average'].toDouble();
}
