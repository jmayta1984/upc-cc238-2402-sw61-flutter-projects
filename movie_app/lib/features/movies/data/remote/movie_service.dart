import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<MovieDto>> getMovies(MovieEndpoint endpoint, int page) async {
    String url =
        '${AppConstants.baseUrl}${AppConstants.movieEndpoint}${endpoint.endpoint}${AppConstants.apiKeyQuery}${AppConstants.pageQuery}$page';
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List maps = jsonResponse['results'];
        return maps.map((map) => MovieDto.fromJson(map)).toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}