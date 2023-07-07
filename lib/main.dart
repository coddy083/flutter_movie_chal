import 'package:flutter/material.dart';
import 'package:flutter_movie_chal/widgets/coming_soon_widget.dart';
import 'package:flutter_movie_chal/widgets/now_in_cinemas_widget.dart';
import 'package:flutter_movie_chal/widgets/popular_movie_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // title: const Text('Popular Movies'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Movies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              PopularMovieWidget(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Now in Cinemas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              NowinCinemasWidget(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Coming Soon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ComingSoonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
