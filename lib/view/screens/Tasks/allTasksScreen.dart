import 'package:api/view/components/Tasks/taskShapeWidget.dart';
import 'package:api/viewModel/bloc/task_cubit.dart';
import 'package:api/viewModel/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTasksScreen extends StatelessWidget {
  String? status = '';

  AllTasksScreen({this.status, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<TaskCubit>(context)
        ..getAllTasks(status ?? ''),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: BlocConsumer<TaskCubit, TaskState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = TaskCubit.get(context);
              return
                cubit.tasksModel == null ?
                    Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.blue,
                        strokeWidth: 10,
                      ),
                    ):
                ListView.separated(
                itemBuilder: (context, index) => TaskShapeWidget(task: cubit.tasksModel?.response?.tasks?[index],),
                separatorBuilder: (context, index) => SizedBox(height: 5,),
                itemCount: cubit.tasksModel?.response?.tasks?.length ?? 0,
              );
            },
          ),
        ),
      ),
    );
  }
}
