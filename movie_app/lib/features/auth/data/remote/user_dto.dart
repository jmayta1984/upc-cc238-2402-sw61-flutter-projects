import 'package:movie_app/features/auth/domain/user.dart';

class UserDto {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String image;
  final String accessToken;
  final String refreshToken;

  const UserDto(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.email,
      required this.image,
      required this.accessToken,
      required this.refreshToken});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
        id: json['id'] ?? 0,
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        gender: json['gender'] ?? '',
        email: json['email'] ?? '',
        image: json['image'] ?? '',
        accessToken: json['accessToken'] ?? '',
        refreshToken: json['refreshToken'] ?? '');
  }

  User toUser() {
    return User(id: id, firstName: firstName, lastName: lastName);
  }
}
