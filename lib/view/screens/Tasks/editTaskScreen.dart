import 'package:api/model/tasksModel.dart';
import 'package:api/viewModel/constant.dart';
import 'package:api/viewModel/network/dioHelper.dart';
import 'package:api/viewModel/network/endPoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  Task? task;

  EditTaskScreen({required this.task, Key? key}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  void initState() {
    titleController.text = widget.task!.title!;
    descriptionController.text = widget.task!.description!;
    super.initState();
  }

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, Enter your Title of Note';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, Enter your Description of Note';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await DioHelper.postData(
                              endPoint: '$tasks/${widget.task?.id}',
                              data: {
                                'title': titleController.text,
                                'description': descriptionController.text,
                                'start_date': widget.task?.startDate,
                                'end_date': widget.task?.endDate,
                                'status': 'in_progress',
                                '_method': 'PUT',
                              },
                              token: token,
                            ).then((value) {
                              print(value.data);
                              Navigator.pop(context);
                            }).catchError((onError) {
                              if (onError is DioError) {
                                print(onError.response?.data);
                              }
                            });
                          }
                        },
                        child: Text('Edit'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await DioHelper.deleteData(
                              endPoint: '$tasks/${widget.task?.id}',
                              token: token,
                            ).then((value) => print(value.data)).catchError((onError){
                              print(onError.response.data);
                            });
                          }
                        },
                        child: Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
