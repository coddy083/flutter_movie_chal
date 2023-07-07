import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/now_in_cinema_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class NowinCinemasWidget extends StatefulWidget {
  const NowinCinemasWidget({
    super.key,
  });

  @override
  State<NowinCinemasWidget> createState() => _NowinCinemasWidgetState();
}

class _NowinCinemasWidgetState extends State<NowinCinemasWidget> {
  final Future<List<NowInCinemaModel>> nowInCinemas =
      ApiService.getNowInCinema();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: nowInCinemas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var movie in snapshot.data ?? [])
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 150,
                            height: 170,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                              fit: BoxFit.cover,
                              //borderradius
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 150,
                              height: 60,
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
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
