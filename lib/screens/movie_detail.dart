import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/movie_detail_model.dart';
import 'package:flutter_movie_chal/models/movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<MovieDetailModel> movieDetail;

  void _fetchMovieDetail() async {
    movieDetail = ApiService.getMovieDetail(widget.movie.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchMovieDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.white,
        body: Stack(
          children: [
            Hero(
              tag: widget.movie.id,
              child: Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${widget.movie.poster_path}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Back Icon Button
            Positioned(
              top: 40,
              left: 20,
              child: PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_sharp,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: movieDetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                              children: [
                                Text(
                                  '${(snapshot.data!.runtime / 60).toStringAsFixed(0)}h ${snapshot.data!.runtime % 60}min',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                for (var genre in snapshot.data!.genres)
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '${genre['name']}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Star Icon
                      MovieRatingWidget(widget.movie.vote_average),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.movie.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Buy Ticket',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieRatingWidget extends StatelessWidget {
  final double rating;
  final double starSize;

  const MovieRatingWidget(this.rating, {super.key, this.starSize = 24.0});

  @override
  Widget build(BuildContext context) {
    int filledStars = (rating / 10 * 5).round();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < filledStars; i++)
          Icon(Icons.star, color: Colors.yellow, size: starSize),
        for (int i = filledStars; i < 5; i++)
          Icon(Icons.star_border, color: Colors.yellow, size: starSize),
      ],
    );
  }
}
