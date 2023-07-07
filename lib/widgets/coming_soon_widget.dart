import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/models/coming_soon_movie_model.dart';
import 'package:flutter_movie_chal/services/api_service.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  final Future<List<ComingSoonMovieModel>> comingSoonMoives =
      ApiService.getComingSoonMoive();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: comingSoonMoives,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var movie in snapshot.data ?? [])
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        clipBehavior: Clip.hardEdge,
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
              ],
            ),
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
