import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight:500,
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    height: 500,
                    child: Image.network(
                      movie.image,
                      height: 500,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    
                    ),
                  ),
                ),
              )
            ];
          },
          body: Text(movie.title)),
    );
  }
}
