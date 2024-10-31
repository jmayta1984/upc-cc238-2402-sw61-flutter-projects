import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.endpoint});
  final MovieEndpoint endpoint;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            endpoint.section,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(

          height: height / 3,
          child: MovieList(
            endpoint: endpoint,
          ),
        )
      ],
    );
  }
}
