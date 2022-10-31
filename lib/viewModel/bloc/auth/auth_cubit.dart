import 'package:api/view/components/toast_message/toast_message.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/local/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_state.dart';
import '../../../model/user.dart' as user;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  Future<void> signInWithFireBase(String email, String password) async {
    emit(SignInWithFirebaseLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      CacheHelper.put(key: 'uId', value: value.user?.uid);
      uId = CacheHelper.get(key: 'uId');
      print(value.user?.email);
      showToast(message: 'Login Successfully');
      emit(SignInWithFirebaseSuccessState());
    }).catchError((error) {
      print(error.toString());
      showToast(
        message: 'Error Login ${error.toString()}',
        color: Colors.red,
      );
      emit(SignInWithFirebaseErrorState(error.toString()));
    });
  }

  user.User? userModel;

  Future<void> registerWithFirebase(
      {required String email, required String username, required String password, required String phone}) async {
    emit(RegisterWithFireBaseLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      CacheHelper.put(key: 'uId', value: value.user?.uid);
      uId = CacheHelper.get(key: 'uId');
      userModel = user.User(
        email: value.user?.email,
        username: username,
        phone: phone,
        uId: value.user?.uid,
        emailVerified: value.user?.emailVerified,
      );
      createUser(userModel!);
      print(value.user.toString());
      showToast(message: "Register Successfully");
      emit(RegisterWithFireBaseSuccessState());
    }).catchError((error) {
      print(error.toString());
      showToast(message: "Error Register ${error.toString()}");
      emit(RegisterWithFireBaseErrorState(error.toString()));
    });
  }

  Future<void> createUser(user.User model) async {
    emit(CreateUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toJson()).then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'Create User Error ${error.toString()}');
      emit(CreateUserErrorState(error.toString()));
    });
  }

  List<user.User?> userList = [];

  Future<void> getUsers(String uId) async {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance
        .collection('hotels')
        .where({'cityId': 'fd9oS5G9KSXzVMo1K0k2'})
        .get()
        .then((value) {
          print(value.docs[0].data());
          value.docs.forEach((element) {
            userList.add(user.User.fromJson(element.data()));
            print(element.data()['phone']);
          });
          // currentUser = user.User.fromJson(value.data()!);
          // print(currentUser?.phone);
          emit(GetUserSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          showToast(message: 'Get User Error ${error.toString()}');
          emit(GetUserErrorState(error.toString()));
        });
  }

  Future<void> updateUser(String uId) async {
    emit(UpdateUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).update({'phone': '01556155979'}).then((value) {
      // print(value.docs[0].data());
      // rentUser = user.User.fromJson(value.data()!);
      // print(currentUser?.phone);
      getUsers(uId);
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      showToast(message: 'Get User Error ${error.toString()}');
      emit(UpdateUserErrorState(error.toString()));
    });
  }
}
