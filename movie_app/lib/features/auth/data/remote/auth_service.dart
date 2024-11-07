import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/auth/data/remote/user_dto.dart';
import 'package:movie_app/features/auth/data/remote/user_request.dart';

class AuthService {
  Future<Resource<UserDto>> login(String username, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(AppConstants.authBaseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            UserRequest(username: username, password: password).toMap()),
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final UserDto userDto = UserDto.fromJson(json);
        return Success(userDto);
      }
      return Error('Error: ${response.statusCode}');
    } catch (error) {
      return Error('Error: ${error.toString()}');
    }
  }
}
