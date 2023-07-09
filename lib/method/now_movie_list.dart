import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/screens/movie_detail.dart';

ListView NowMovieListView(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(
                movie: snapshot.data![index],
              ),
              fullscreenDialog: true,
            ),
          );
        },
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: snapshot.data![index].id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 150,
                  height: 170,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${snapshot.data![index].backdrop_path}',
                    fit: BoxFit.cover,
                    //borderradius
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: Text(
                    snapshot.data![index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
