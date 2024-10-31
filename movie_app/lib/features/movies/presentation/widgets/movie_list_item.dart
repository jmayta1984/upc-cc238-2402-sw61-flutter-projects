import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Card(
      child: Column(
        children: [
          Image.network(
            movie.image,
            height: height * 0.30,
          ),
          Text(movie.title)
        ],
      ),
    );
  }
}
