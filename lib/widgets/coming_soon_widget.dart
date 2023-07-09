import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/method/now_movie_list.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  final Future<List<MovieModel>> movies =
      ApiService.getMovieList('coming-soon');
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
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
