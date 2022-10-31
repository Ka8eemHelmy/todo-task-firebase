import 'package:api/view/screens/Tasks/homeScreen.dart';
import 'package:api/viewModel/bloc/auth/auth_cubit.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:api/view/screens/Tasks/tasksScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      'Login Page',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter your Phone';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        hintStyle: TextStyle(color: Colors.white),
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
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
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
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
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
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
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
                    ElevatedButton(
                      onPressed: () async {
                        emailController.text = 'kareem@example.com';
                        passwordController.text = 'password';
                        userNameController.text = 'ka8eem';
                        phoneController.text = '01064648972';
                        if (formKey.currentState!.validate()) {
                          print('Go Login');
                          AuthCubit.get(context).registerWithFirebase(email: emailController.text, password: passwordController.text, username: userNameController.text, phone: phoneController.text);
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
                      child: Text('Register'),
                    ),
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
