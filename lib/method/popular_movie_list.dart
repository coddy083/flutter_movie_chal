import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/widgets/popular_movie_item.dart';

ListView popularMoiveList(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    itemBuilder: (context, index) {
      var movie = snapshot.data![index];
      return PopularMoiveListItemWidget(movie: movie);
    },
    separatorBuilder: (context, index) {
      return const SizedBox(
        width: 20,
      );
    },
  );
}
