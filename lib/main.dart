import 'package:api/viewModel/bloc/auth/auth_cubit.dart';
import 'package:api/viewModel/bloc/task_cubit.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/view/screens/auth/loginScreen.dart';
import 'package:api/view/screens/Tasks/tasksScreen.dart';
import 'package:api/viewModel/network/local/cache_helper.dart';
import 'package:api/viewModel/observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// Eraasoft@#$2020
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        darkTheme: ThemeData(

        ),
        themeMode: ThemeMode.dark,
        home: LoginScreen(),
      ),
    );
  }
}