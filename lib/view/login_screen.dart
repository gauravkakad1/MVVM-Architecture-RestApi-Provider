import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.home);
            },
            child: Text("Click",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}