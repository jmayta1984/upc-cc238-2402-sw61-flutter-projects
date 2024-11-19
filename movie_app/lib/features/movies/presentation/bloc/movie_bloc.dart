import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/repository/movie_repository.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_event.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMoviesEvent>(
      (event, emit) async {
        final currentState = state;
        List<Movie> movies = [];

        if (currentState is MovieLoaded) {
          movies = currentState.movies;
        }

        emit(MovieLoading());

        final Resource<List<Movie>> result =
            await MovieRepository().getMovies(event.endpoint, event.page);

        if (result is Success) {
          final newMovies = result.data!;
          final hasReachedEnd = newMovies.length < AppConstants.pageSize;
          movies = List.from(movies)..addAll(newMovies);
          emit(MovieLoaded(movies: movies, hasReachedEnd: hasReachedEnd));
        } else {
          emit(MovieError(message: result.message!));
        }
      },
    );
  }
}
