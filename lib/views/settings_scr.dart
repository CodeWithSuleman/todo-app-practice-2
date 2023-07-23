import 'package:flutter/material.dart';
import 'package:todo_app_practice_2/utils/color_constant.dart';
import 'package:todo_app_practice_2/widgets/custom_appbar.dart';
import 'package:todo_app_practice_2/widgets/custom_listtile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Settings"),
        backgroundColor: Color(ConstantColors.secondaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'ToDo Setting',
                    style: TextStyle(
                      color: Color(ConstantColors.primarycolor),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              CustomListile(
                leading: Icons.touch_app,
                title: "Tap List",
                callback: () {},
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                  leading: Icons.more_horiz_rounded,
                  title: "Reorder",
                  subtitle: "Long Press on List to Reorder",
                  trailing: Icons.done),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text(
                    'Customize',
                    style: TextStyle(
                      color: Color(ConstantColors.primarycolor),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const CustomListile(
                leading: Icons.sunny,
                title: "Theme",
                subtitle: "System",
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.color_lens,
                title: "Theme Color",
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      color: Color(ConstantColors.primarycolor),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.question_mark_outlined,
                title: "Help",
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.rate_review,
                title: "Rate this App",
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.privacy_tip,
                title: "Privacy",
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.assignment,
                title: "Licenses",
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Text(
                    'Delete Data',
                    style: TextStyle(
                      color: Color(ConstantColors.primarycolor),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              const CustomListile(
                leading: Icons.delete,
                title: "Delete Data",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
