import 'package:movie_app/core/app_constants.dart';

enum MovieEndpoint {
  topRated(section: 'Top rated', endpoint: AppConstants.topRated),
  popular(section: 'Popular', endpoint: AppConstants.popular),
  upcoming(section: 'Upcoming', endpoint: AppConstants.upcoming),
  nowPlayin(section: 'Now playing', endpoint:  AppConstants.nowPlaying);

  const MovieEndpoint({required this.section, required this.endpoint});
  final String section;
  final String endpoint;
}
