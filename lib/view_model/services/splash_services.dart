
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import '../../model/UserModel.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    getUserData().then((value){
       if(value.token.toString() == 'null' || value.token.toString() == ''){
         Future.delayed(Duration(seconds: 3));
         Navigator.pushNamed(context, RoutesName.login);
       }
       else{
         Future.delayed(Duration(seconds: 3));
         Navigator.pushNamed(context, RoutesName.home);
       }
    }).onError((error, stackTrace){
    if(kDebugMode){
      print(error.toString());
    }
    });
  }

}
