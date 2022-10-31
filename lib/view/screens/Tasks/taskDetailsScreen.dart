import 'package:api/model/tasksModel.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatefulWidget {
  int id;

  TaskDetailsScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {

  @override
  void initState() {
    getTaskDetails();
    super.initState();
  }

  Task? task;
  Future getTaskDetails() async {
    await DioHelper.getData(endPoint: '$tasks/${widget.id}', token: token,).then((value) {
      print(value.data);
      task = Task.fromJson(value.data['response']);
      print(task?.title);
    }).catchError((onError){
      if(onError is DioError){
        print(onError.response?.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: ,
      // ),
    );
  }
}
