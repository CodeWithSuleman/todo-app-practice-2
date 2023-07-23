import 'package:flutter/material.dart';
import 'package:todo_app_practice_2/models/todo_model.dart';
import 'package:todo_app_practice_2/services/firebase_crud.dart';
import 'package:todo_app_practice_2/utils/color_constant.dart';
import 'package:todo_app_practice_2/views/create_user_box.dart';
import 'package:todo_app_practice_2/views/done_scr.dart';
import 'package:todo_app_practice_2/views/update_user_box_scr.dart';
import 'package:todo_app_practice_2/widgets/custom_appbar.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosState();
}

class _TodosState extends State<TodosScreen> {
  int? selectedTileIndex;
  List<User> userList = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("TODOS"),
        backgroundColor: Color(ConstantColors.secondaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: FutureBuilder(
          future: FirebaseCRUD().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Dismissible(
                      key: ValueKey(snapshot.data![index].id),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd ||
                            direction == DismissDirection.endToStart) {
                          FirebaseCRUD().deleteUser(snapshot.data![index]);
                        }
                      },
                      background: Container(
                        padding: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        color: Color(ConstantColors.redColor),
                        child: const Icon(Icons.delete),
                      ),
                      child: ListTile(
                        title: Text('Name: ${snapshot.data![index].name}'),
                        subtitle: Text('Task: ${snapshot.data![index].task}'),
                        leading: GestureDetector(
                          child: Container(
                            height: height * 0.03,
                            width: width * 0.07,
                            decoration: BoxDecoration(
                                color: selectedTileIndex == index
                                    ? Color(ConstantColors.primarycolor)
                                    : Color(ConstantColors.whiteColor),
                                shape: BoxShape.rectangle),
                            child: selectedTileIndex == index
                                ? Icon(
                                    Icons.check,
                                    color: Color(ConstantColors.themeColor),
                                  )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              if (selectedTileIndex == index) {
                                selectedTileIndex = null;
                              } else {
                                selectedTileIndex = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoneScreen(
                                        selectedTileIndex: index,
                                        user: User(
                                          id: snapshot.data![index].id,
                                          name: snapshot.data![index].name,
                                          task: snapshot.data![index].task,
                                        ),
                                      ),
                                    ));
                              }
                            });
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => UpdateUserAlertBox(
                                    id: snapshot.data![index].id,
                                    name: snapshot.data![index].name,
                                    task: snapshot.data![index].task),
                              );
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                    ),
                  );
                },
              );
            }
            return const Text("No Data Found");
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const CreateUserAlertBox(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
