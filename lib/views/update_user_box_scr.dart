import 'package:flutter/material.dart';
import 'package:todo_app_practice_2/models/todo_model.dart';
import 'package:todo_app_practice_2/services/firebase_crud.dart';
import 'package:todo_app_practice_2/utils/color_constant.dart';
import 'package:todo_app_practice_2/widgets/primary_btn.dart';

class UpdateUserAlertBox extends StatefulWidget {
  final String id;
  final String name;
  final String task;
  const UpdateUserAlertBox(
      {super.key, required this.id, required this.name, required this.task});

  @override
  State<UpdateUserAlertBox> createState() => _UpdateUserAlertBoxState();
}

class _UpdateUserAlertBoxState extends State<UpdateUserAlertBox> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  @override
  void initState() {
    super.initState();
    idController.text = widget.id;
    nameController.text = widget.name;
    taskController.text = widget.task;
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: height * 0.2),
            AlertDialog(
              title: Column(
                children: [
                  const Text("Please Fill the Fields"),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    readOnly: true,
                    controller: idController,
                    decoration: InputDecoration(
                      label: const Text('Enter Id'),
                      hintText: "Enter Your Id",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: const Text('Enter Name'),
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                      label: const Text('Enter Task'),
                      hintText: "Enter Your Task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: width * 0.2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(ConstantColors.primarycolor),
                      ),
                      height: height * 0.07,
                      width: width * 0.2,
                      child: PrimaryButton(
                        bName: "Cancel",
                        callback: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(ConstantColors.primarycolor),
                      ),
                      height: height * 0.07,
                      width: width * 0.2,
                      child: PrimaryButton(
                        bName: "Submit",
                        callback: () {
                          FirebaseCRUD().updateUser(
                            User(
                                id: idController.text,
                                name: nameController.text,
                                task: taskController.text),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
