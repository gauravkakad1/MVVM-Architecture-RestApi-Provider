import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/services/splash_services.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferance = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          InkWell(
            onTap: (){
              userPreferance.removeUser().then((value){
                Navigator.pushNamed(context, RoutesName.signup);
              });
            },
            child: Center(
              child: Text("Logout"),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}
