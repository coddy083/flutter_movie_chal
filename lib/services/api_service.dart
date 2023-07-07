import 'dart:convert';

import 'package:flutter_movie_chal/models/coming_soon_movie_model.dart';
import 'package:flutter_movie_chal/models/now_in_cinema_model.dart';
import 'package:flutter_movie_chal/models/popular_movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<PopularMovieModel>> getPopularMoive() async {
    List<PopularMovieModel> popularMovies = [];
    final url = Uri.parse('$baseUrl/popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var movies = responseData['results'];
      // final List<dynamic> movies = jsonDecode(movieData);
      for (var movie in movies) {
        popularMovies.add(PopularMovieModel.fromJson(movie));
      }
      return popularMovies;
    }
    throw Error();
  }

  static Future<List<NowInCinemaModel>> getNowInCinema() async {
    List<NowInCinemaModel> nowInCinema = [];
    final url = Uri.parse('$baseUrl/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var movies = responseData['results'];
      // final List<dynamic> movies = jsonDecode(movieData);
      for (var movie in movies) {
        nowInCinema.add(NowInCinemaModel.fromJson(movie));
      }
      return nowInCinema;
    }
    throw Error();
  }

  static Future<List<ComingSoonMovieModel>> getComingSoonMoive() async {
    List<ComingSoonMovieModel> comingSoonMoives = [];
    final url = Uri.parse('$baseUrl/coming-soon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var movies = responseData['results'];
      // final List<dynamic> movies = jsonDecode(movieData);
      for (var movie in movies) {
        comingSoonMoives.add(ComingSoonMovieModel.fromJson(movie));
      }
      return comingSoonMoives;
    }
    throw Error();
  }
}
