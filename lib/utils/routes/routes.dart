import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/view/home_screen.dart';
import 'package:mvvm_architecture_restapi_provider/view/signup_screen.dart';
import 'package:mvvm_architecture_restapi_provider/view/splash_screen.dart';
import '../../view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: SafeArea(child: Text("No Route defined")),
                ));
    }
  }
}
