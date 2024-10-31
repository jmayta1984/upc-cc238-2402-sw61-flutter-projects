import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieRepository {
  final MovieService movieService;
  MovieRepository({required this.movieService});

  Future<List<Movie>> getMovies(MovieEndpoint endpoint, int page) async {
    List<MovieDto> moviesDto = await movieService.getMovies(endpoint, page);
    return moviesDto.map((movieDto) => movieDto.toMovie()).toList();
  }
}
