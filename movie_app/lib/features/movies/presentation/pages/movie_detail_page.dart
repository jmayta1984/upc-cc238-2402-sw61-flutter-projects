import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/bloc/favorite_cubit.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';


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
              actions: [
                BlocBuilder<FavoriteCubit, bool>(
                  builder: (context, state) => IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().toggleFavorite();
                      },
                      icon: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            state ? Icons.favorite : Icons.favorite_border,
                            color: Colors.yellow.shade800,
                          ),
                        ),
                      )),
                )
              ],
              floating: true,
              pinned: true,
              expandedHeight: 500,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(movie.title),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        "Recommendations",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: BlocProvider<MovieBloc>(
                        create: (context) => MovieBloc(),
                        child: MovieList(
                          endpoint:
                              '${AppConstants.baseUrl}${AppConstants.movieEndpoint}/${movie.id}${AppConstants.recommendations}',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        "Similars",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: BlocProvider<MovieBloc>(
                        create: (context) => MovieBloc(),
                        child: MovieList(
                          endpoint:
                              '${AppConstants.baseUrl}${AppConstants.movieEndpoint}/${movie.id}${AppConstants.similar}',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
