import 'package:flutter/material.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.endpoint});
  final MovieEndpoint endpoint;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              endpoint.section,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: MovieList(
              endpoint:
                  '${AppConstants.baseUrl}${AppConstants.movieEndpoint}${endpoint.endpoint}',
            ),
          )
        ],
      ),
    );
  }
}
