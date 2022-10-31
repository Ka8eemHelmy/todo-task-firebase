import 'package:api/model/tasksModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskShapeWidget extends StatelessWidget {
  Task? task;
  TaskShapeWidget({required this.task, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[600]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.timer_outlined,
              color: Colors.blue,
            ),
            title: Text(
              task?.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            task?.description ?? '',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(0.2)
                  ),
                  child: Text(
                    '${DateFormat.Hms().format(DateTime.parse(task?.startDate ?? ''))}\n${DateFormat.yMMMd().format(DateTime.parse(task?.startDate ?? ''))}',
                    // task?.startDate ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red.withOpacity(0.2)
                  ),
                  child: Text(
                    '${DateFormat.Hms().format(DateTime.parse(task?.endDate ?? ''))}\n${DateFormat.yMMMd().format(DateTime.parse(task?.endDate ?? ''))}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
