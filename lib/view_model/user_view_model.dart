import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture_restapi_provider/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser (UserModel model)async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', model.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser ()async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    notifyListeners();
    return UserModel(token: token.toString());
  }
  Future<bool> removeUser()async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

}