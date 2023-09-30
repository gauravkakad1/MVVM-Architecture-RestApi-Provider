import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/model/auth_view_model.dart';
import 'package:mvvm_architecture_restapi_provider/res/components/my_button.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ValueNotifier<bool> visible = ValueNotifier<bool>(false);

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    visible.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<AuthViewModel>(context);

    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("LoginScreen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: 400,
                child: TextFormField(
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.alternate_email),
                      hintText: "eve.holt@reqres.in",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: 400,
                child: ValueListenableBuilder(
                  valueListenable: visible,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: visible.value,
                      obscuringCharacter: "*",
                      focusNode: passwordFocusNode,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              visible.value = !visible.value;
                            },
                            child: visible.value
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility),
                          ),
                          hintText: "password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              MyButton(
                  title: "Login",
                  loading: _authViewModel.loginLoading,
                  onpress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushbarMessage(context, "Enter email address");
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushbarMessage(context, "Enter password");
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushbarMessage(context, "Enter 6 Digit Password");
                    } else {
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString()
                      };
                      _authViewModel.loginApi(data, context);
                    }
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
                  child: const Text("Don't have an account ? Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
