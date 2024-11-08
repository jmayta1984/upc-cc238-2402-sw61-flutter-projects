import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieRepository {

  Future<Resource<List<Movie>>> getMovies(MovieEndpoint endpoint, int page) async {
    Resource<List<MovieDto>> result = await MovieService().getMovies(endpoint, page);

     if (result is Success) {
      return Success(result.data!.map((movieDto) => movieDto.toMovie()).toList());
    } else {
      return Error(result.message!);
    }
  }
}
