import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieDto {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;

  MovieDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
    );
  }

  Movie toMovie() {
    return Movie(
      id: id,
      title: title,
      image: AppConstants.imageUrl + posterPath,
      voteAverage: voteAverage,
    );
  }
}
