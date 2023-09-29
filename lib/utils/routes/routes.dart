
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/view/home_screen.dart';

import '../../view/login_screen.dart';

class Routes {
  static Route <dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
      default :
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: SafeArea(
              child:Text("No Route defined")
          ),
        )
        );
    }
  }

}
