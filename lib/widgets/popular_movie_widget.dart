import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/method/popular_movie_list.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class PopularMovieWidget extends StatefulWidget {
  const PopularMovieWidget({
    super.key,
  });

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  final Future<List<MovieModel>> movies = ApiService.getMovieList('popular');

  @override
  void initState() {
    // TODO: implement initStat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(height: 200, child: popularMoiveList(snapshot));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
