import 'package:movie_app/core/movie_endpoint.dart';

abstract class MovieEvent {}

class GetMoviesEvent extends MovieEvent {
  final MovieEndpoint endpoint;
  final int page;

  GetMoviesEvent({required this.endpoint ,required this.page});
}