import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/method/now_movie_list.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class NowinCinemasWidget extends StatefulWidget {
  const NowinCinemasWidget({
    super.key,
  });

  @override
  State<NowinCinemasWidget> createState() => _NowinCinemasWidgetState();
}

class _NowinCinemasWidgetState extends State<NowinCinemasWidget> {
  final Future<List<MovieModel>> movies =
      ApiService.getMovieList('now-playing');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 240,
            child: NowMovieListView(snapshot),
          );
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
