import 'package:mobx/mobx.dart';
import 'package:moviequest/models/user_model.dart';

part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  @observable
  late UserModel user;
}
