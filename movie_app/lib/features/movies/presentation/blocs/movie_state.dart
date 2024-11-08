import 'package:movie_app/features/movies/domain/movie.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final bool hasReachedEnd;

  MovieLoaded({required this.movies, required this.hasReachedEnd});
}

class MovieError extends MovieState {
  final String message;

  MovieError({required this.message});
}