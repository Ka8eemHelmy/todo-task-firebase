import 'package:api/view/screens/Tasks/allTasksScreen.dart';
import 'package:api/view/screens/Tasks/newTaskScreen.dart';
import 'package:api/viewModel/bloc/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../viewModel/bloc/task_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<TaskCubit>(context)..getDashboardData(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocConsumer<TaskCubit, TaskState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = TaskCubit.get(context);
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[800]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            animationDuration: 1000,
                            lineWidth: 10.0,
                            backgroundWidth: 8,
                            animation: true,
                            percent: (cubit.newTasks ?? 0) / (cubit.allTasks ?? 0),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.green[800],
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            center: CircularPercentIndicator(
                              radius: 70.0,
                              animationDuration: 1000,
                              lineWidth: 10.0,
                              backgroundWidth: 8,
                              animation: true,
                              percent: (cubit.progressTasks ?? 0) / (cubit.allTasks ?? 0),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue[800],
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              center: CircularPercentIndicator(
                                radius: 50.0,
                                animationDuration: 1000,
                                lineWidth: 10.0,
                                animation: true,
                                percent: (cubit.outdatedTasks ?? 0) / (cubit.allTasks ?? 0),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.deepOrangeAccent[800],
                                backgroundColor: Colors.grey.withOpacity(0.4),
                                backgroundWidth: 8,
                                center: CircularPercentIndicator(
                                  radius: 30.0,
                                  animationDuration: 1000,
                                  lineWidth: 10.0,
                                  animation: true,
                                  percent: (cubit.completedTasks ?? 0) / (cubit.allTasks ?? 0),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.cyanAccent,
                                  backgroundColor: Colors.grey.withOpacity(0.4),
                                  backgroundWidth: 8,
                                  center: Text(
                                    '${cubit.allTasks}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'New Tasks',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${cubit.newTasks ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'In Progress',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${cubit.progressTasks ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.deepOrangeAccent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Outdated',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${cubit.outdatedTasks ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.cyanAccent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${cubit.completedTasks ?? ''}',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.6),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasksScreen()));
                  },
                  leading: Icon(
                    Icons.sort_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'All Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasksScreen(status: 'new',)));
                  },
                  leading: Icon(
                    Icons.nest_cam_wired_stand_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'New Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasksScreen(status: 'in_progress',)));
                  },
                  leading: Icon(
                    Icons.timer_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'In Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasksScreen(status: 'outdated',)));
                  },
                  leading: Icon(
                    Icons.timer_off_outlined,
                    color: Colors.red,
                  ),
                  title: Text(
                    'OutDates',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasksScreen(status: 'completed',)));
                  },
                  leading: Icon(
                    Icons.done,
                    color: Colors.cyanAccent,
                  ),
                  title: Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskScreen()));
        },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
