
abstract class MovieEvent {}

class GetMoviesEvent extends MovieEvent {
  final String endpoint;
  final int page;

  GetMoviesEvent({required this.endpoint ,required this.page});
}