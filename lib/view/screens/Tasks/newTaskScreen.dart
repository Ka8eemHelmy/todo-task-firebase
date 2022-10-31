import 'package:api/viewModel/bloc/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var tittle = TextEditingController();
  var description = TextEditingController();
  var startDate = TextEditingController();
  var startDateTime = TextEditingController();
  DateTime? startDateWithTome;
  var endDate = TextEditingController();
  var endDateTime = TextEditingController();
  DateTime? endDateWithTome;

  final ImagePicker _picker = ImagePicker();
  late XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Add New Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tittle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, Enter your Tittle';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tittle',
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
                  controller: description,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, Enter your Description';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Description',
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
                Text(
                  'Start Date',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: startDate,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, Enter your Date';
                          }
                          return null;
                        },
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            // startDate.text = DateFormat.yMd().format(DateTime.parse(value.toString()));
                            startDate.text = DateFormat('yyyy/MM/dd').format(value!);
                          });
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Date',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: startDateTime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, Enter your Time';
                          }
                          return null;
                        },
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            startDateTime.text = '${value?.hour}:${value?.minute}';
                          });
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Time',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'End Date',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: endDate,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, Enter your Date';
                          }
                          return null;
                        },
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            // endDate.text = DateFormat.yMd().format(DateTime.parse(value.toString()));
                            endDate.text = DateFormat('yyyy/MM/dd').format(value!);
                          });
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Date',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.none,
                        controller: endDateTime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, Enter your Time';
                          }
                          return null;
                        },
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            endDateTime.text = '${value?.hour}:${value?.minute}';
                          });
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Time',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  child: InkWell(
                    onTap: () async {
                      image = await _picker.pickImage(source: ImageSource.gallery);
                      print(image?.path);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.grey[800]!.withOpacity(0.1)),
                      child: Center(
                          child: Text(
                        'Press, To Pick Image',
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      TaskCubit.get(context)
                          .newTask(
                            title: tittle.text,
                            description: description.text,
                            startDate: '${startDate.text}',
                            endDate: '${endDate.text}',
                        image: image,
                          )
                          .then((value) => Navigator.pop(context));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[600],
                    ),
                    child: Text(
                      'Add New Task',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
