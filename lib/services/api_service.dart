import 'dart:convert';

import 'package:flutter_movie_chal/models/movie_detail_model.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getMovieList(String movieUrlText) async {
    List<MovieModel> popularMovies = [];
    final url = Uri.parse('$baseUrl/$movieUrlText');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var movies = responseData['results'];
      // final List<dynamic> movies = jsonDecode(movieData);
      for (var movie in movies) {
        popularMovies.add(MovieModel.fromJson(movie));
      }
      return popularMovies;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return MovieDetailModel.fromJson(responseData);
    }
    throw Error();
  }
}
