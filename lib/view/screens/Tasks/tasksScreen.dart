import 'package:api/model/tasksModel.dart';
import 'package:api/view/components/Tasks/taskWidget.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../viewModel/constant.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    getTasks();
    super.initState();
  }

  TasksModel? tasksModel;

  Future getTasks() async {
    await DioHelper.getData(endPoint: tasks, query: {}, token: token).then((value) {
      print(value.data);
      tasksModel = TasksModel.fromJson(value.data);
      print(tasksModel?.response?.tasks?[0].title);
      setState(() {

      });
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response?.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
          tasksModel == null ?
              Center(child: CircularProgressIndicator()):
          ListView.builder(
            itemBuilder: (context, index) {
              return TaskWidget(task: tasksModel?.response?.tasks?[index],);
            },
            itemCount: tasksModel?.response?.tasks?.length,
          ),
        ),
      ),
    );
  }
}
