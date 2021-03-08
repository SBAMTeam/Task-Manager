import 'package:get/get.dart';
import 'package:taskmanager/Models/Usermodel.dart';

class UserController extends GetxController {
  final registerLink = 'http://56238798de8f.ngrok.io/taskm/postUser.php';
  static UserController _userController;
  static UserController getInstance() {
    if (_userController == null)
      return _userController = UserController();
    else
      return _userController;
  }

  Usermodel usermodel = Usermodel();

  Future register() async {}
}
