import 'package:api/viewModel/bloc/task_state.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/tasksModel.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of<TaskCubit>(context);

  int? newTasks;
  int? progressTasks;
  int? completedTasks;
  int? outdatedTasks;
  int? allTasks;

  Future getDashboardData() async {
    emit(GetDashboardDataLoadingState());
    await DioHelper.getData(
      endPoint: dashboard,
      token: token,
    ).then((value) {
      print(value.data);
      newTasks = value.data['0']['new tasks'];
      progressTasks = value.data['0']['in progress tasks'];
      completedTasks = value.data['0']['completed tasks'];
      outdatedTasks = value.data['0']['outdated tasks'];
      allTasks = value.data['0']['all tasks'];
      emit(GetDashboardDataSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response?.data);
      }
      emit(GetDashboardDataErrorState());
    });
  }

  TasksModel? tasksModel;

  Future getAllTasks(String status) async {
    emit(GetAllTasksLoadingState());
    tasksModel = null;
    await DioHelper.getData(
      endPoint: tasks,
      query: status.isEmpty
          ? {}
          : {
              'status': status,
            },
      token: token,
    ).then((value) {
      print(value.data);
      tasksModel = TasksModel.fromJson(value.data);
      emit(GetAllTasksSuccessState());
    }).catchError((onError) {
      print(onError.response?.data);
      emit(GetAllTasksErrorState());
    });
  }

  Task? newTaskModel;

  Future<void> newTask(
      {required String title,
      required String description,
      dynamic image,
      dynamic voice,
      required String startDate,
      required String endDate}) async {
    emit(NewTaskLoadingState());
    FormData formData = FormData.fromMap({
      'title': title,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'image' : await MultipartFile.fromFile(image.path,filename: image.name),
    });
    await DioHelper.postData(
      endPoint: tasks,
      data: formData,
      token: token,
    ).then((value) {
      print(value.data);
      newTaskModel = Task.fromJson(value.data['response']);
      tasksModel?.response?.tasks?.add(newTaskModel!);
      emit(NewTaskSuccessState());
    }).catchError((onError) {
      print(onError.response?.data);
      emit(NewTaskErrorState());
    });
  }
}
