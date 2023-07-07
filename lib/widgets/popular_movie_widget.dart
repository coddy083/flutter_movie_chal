import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/popular_movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class PopularMovieWidget extends StatefulWidget {
  const PopularMovieWidget({
    super.key,
  });

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  final Future<List<PopularMovieModel>> popularMovies =
      ApiService.getPopularMoive();

  @override
  void initState() {
    // TODO: implement initStat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var movie in snapshot.data ?? [])
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300,
                    height: 250,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                      fit: BoxFit.cover,
                      //borderradius
                    ),
                  ),
              ],
            ),
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
