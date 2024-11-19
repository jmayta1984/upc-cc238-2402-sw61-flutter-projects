import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<Resource<List<MovieDto>>> getMovies(String endpoint, int page) async {
    String url =
        '$endpoint${AppConstants.apiKeyQuery}${AppConstants.pageQuery}$page';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List maps = jsonResponse['results'];
        return Success(maps.map((map) => MovieDto.fromJson(map)).toList());
      }
        return Error('Error: ${response.statusCode}');
    } catch (error) {
      return Error('Error: ${error.toString()}');
    }
  }
}
