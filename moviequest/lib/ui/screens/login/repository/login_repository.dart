import 'package:moviequest/constansts/endpoints.dart';
import 'package:moviequest/models/user_model.dart';
import 'package:moviequest/services/http_manager.dart';
import 'package:moviequest/ui/screens/login/results/login_result.dart';
import 'package:moviequest/ui/screens/login/repository/login_errors.dart'
    as authErrors;

class LoginRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result["results"] != null) {
      final user = UserModel.fromMap(result["results"]);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> login(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.login,
      method: HttpMetod.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> creatAcont(
      {required String email,
      required String password,
      required String checkPassword,
      required String name}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.userRegister,
      method: HttpMetod.post,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'checkPassword': checkPassword,
      },
    );

    return handleUserOrError(result);
  }
}
