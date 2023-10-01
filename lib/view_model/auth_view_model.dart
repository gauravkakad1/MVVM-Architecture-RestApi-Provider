import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/model/UserModel.dart';
import 'package:mvvm_architecture_restapi_provider/respository/auth_repository.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/utils/utils.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  setLoginLoading(bool load) {
    _loginLoading = load;
    notifyListeners();
  }

  bool _registerLoading = false;
  bool get registerLoading => _registerLoading;
  setregisterLoading(bool load) {
    _registerLoading = load;
    notifyListeners();
  }

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    setLoginLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoginLoading(false);
      final userPreferance = Provider.of<UserViewModel>(context,listen: false);
      userPreferance.saveUser(UserModel(token: value['token'].toString()));
      Utils.flushbarMessage(context, 'login succesfull');
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoginLoading(false);
      Utils.flushbarMessage(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<dynamic> registerApi(dynamic data, BuildContext context) async {
    setregisterLoading(true);
    _myRepo.registerApi(data).then((value) {
      setregisterLoading(false);
      Navigator.pushNamed(context, RoutesName.login);
      Utils.flushbarMessage(context, "Register successful");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setregisterLoading(false);
      Utils.flushbarMessage(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
