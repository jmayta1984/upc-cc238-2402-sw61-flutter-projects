import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/auth/data/remote/auth_service.dart';
import 'package:movie_app/features/auth/data/remote/user_dto.dart';
import 'package:movie_app/features/auth/domain/user.dart';

class AuthRepository {
  Future<Resource<User>> login(String username, String password) async {
    Resource<UserDto> result = await AuthService().login(username, password);

    if (result is Success) {
      return Success(result.data!.toUser());
    } else {
      return Error(result.message!);
    }
  }
}
