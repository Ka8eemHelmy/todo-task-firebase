import 'package:api/view/screens/Tasks/homeScreen.dart';
import 'package:api/view/screens/auth/RegisterScreen.dart';
import 'package:api/viewModel/bloc/auth/auth_cubit.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:api/view/screens/Tasks/tasksScreen.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locale_keys.g.dart';
import '../../../viewModel/bloc/auth/auth_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            context.setLocale(Locale('en'));
          }, child: Text('en'),),
          SizedBox(width: 10,),
          TextButton(onPressed: (){
            context.setLocale(Locale('ar'));
          }, child: Text('ar'),),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.loginPage.tr(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter your Email';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.email.tr(),
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter your Password';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.password.tr(),
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            emailController.text = 'kareem@example.com';
                            passwordController.text = 'password';
                            if (formKey.currentState!.validate()) {
                              print('Go Login');
                              AuthCubit.get(context).signInWithFireBase(emailController.text, passwordController.text);
                              // await DioHelper.postData(endPoint: login, data: {
                              //   'email': emailController.text,
                              //   'password': passwordController.text,
                              // }).then((value) {
                              //   // print(value.data);
                              //   // print(value.data['authorisation']['token']);
                              //   token = value.data['authorisation']['token'];
                              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              // }).catchError((onError) {
                              //   if (onError is DioError) {
                              //     print(onError.response?.data);
                              //   }
                              // });
                            }
                          },
                          child: Text(LocaleKeys.login.tr()),
                        );
                      },
                    ),
                    SizedBox(height: 50,),
                    TextButton(child: Text(LocaleKeys.registerNow.tr()), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
