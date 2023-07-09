import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/screens/movie_detail.dart';

class PopularMoiveListItemWidget extends StatelessWidget {
  const PopularMoiveListItemWidget({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(
              movie: movie,
            ),
            fullscreenDialog: true,
          ),
        );
        //Material page route
      },
      child: Hero(
        tag: movie.id,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
            fit: BoxFit.cover,
            //borderradius
          ),
        ),
      ),
    );
  }
}
