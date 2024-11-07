import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/presentation/widgets/movies_section.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          MovieEndpoint.values.length,
          (index) => MoviesSection(endpoint: MovieEndpoint.values[index]),
        ),
      ),
    );
  }
}
