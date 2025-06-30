import 'dart:convert';

import 'package:moviequest/constansts/endpoints.dart';
import 'package:moviequest/models/user_model.dart';
import 'package:moviequest/services/http_manager.dart';
import 'package:moviequest/ui/screens/login/results/login_result.dart';
import 'package:moviequest/ui/screens/login/repository/login_errors.dart'
    as authErrors;
import 'package:http/http.dart' as http;
import 'package:moviequest/ui/screens/profile/result/change_password_result.dart';
import 'package:moviequest/ui/screens/profile/result/delete_acount_result.dart';

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

  Future<AuthResult> validateToken(String token) async {
    final result =
        await http.post(Uri.parse(Endpoints.validateToken), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    Map<dynamic, dynamic> data = jsonDecode(result.body);
    return handleUserOrError(data);
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

  Future<ChangePasswordResult> changePassword({
    required String oldpassword,
    required String newPassword,
    required String confirmNewPassword,
    required String token,
  }) async {
    print(token);

    final result = await _httpManager.restRequest(
        method: HttpMetod.post,
        url: Endpoints.changepassword,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "oldpassword": oldpassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword
        });

    if (result["results"] != null) {
      final user = result["results"];
      return ChangePasswordResult.success(user);
    } else {
      final errorMessage = result['detail'] ?? "Ocorreu um erro desconhecido.";
      return ChangePasswordResult.error(errorMessage);
    }
  }

  Future<DeleteAcountResult> deleteAcount(
      {required String password, required String token}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.deleteUser,
      method: HttpMetod.post,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {"password": password},
    );


    if (result["result"] != null) {
      final user = result["result"];
      return DeleteAcountResult.success(user);
    } else {
      print(result['detail']);
      return DeleteAcountResult.error(result['detail']);
    }
  }
}
