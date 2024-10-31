import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/presentation/widgets/movies_section.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MoviesSection(endpoint: MovieEndpoint.nowPlayin,),
       MoviesSection(endpoint: MovieEndpoint.popular,),
        MoviesSection(endpoint: MovieEndpoint.topRated,),
        MoviesSection(endpoint: MovieEndpoint.upcoming,),
      ],
    );
  }
}
