import 'package:flutter/material.dart';
import 'package:todo_app_practice_2/models/todo_model.dart';

class DoneScreen extends StatefulWidget {
  final User user;
  final int selectedTileIndex;
  const DoneScreen(
      {super.key, required this.selectedTileIndex, required this.user});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Text("KKK")
      ],
    ))
























        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        //   child: FutureBuilder(
        //     future: FirebaseCRUD().getUser(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Text(snapshot.error.toString());
        //       }
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //           itemCount: snapshot.data!.length,
        //           itemBuilder: (context, index) {
        //             return Card(child: Dismissible(
        //                   key: ValueKey(snapshot.data![index].id),
        //                   onDismissed: (direction) {
        //                     if (direction == DismissDirection.startToEnd ||
        //                         direction == DismissDirection.endToStart) {
        //                       FirebaseCRUD().deleteUser(snapshot.data![index]);
        //                     }
        //                   },
        //                   background: Container(
        //                     padding:  EdgeInsets.only(left: 20),
        //                     alignment: Alignment.centerLeft,
        //                     color: Color(ConstantColors.redColor),
        //                     child: const Icon(Icons.delete),
        //                   ), child:  Text("LLL"));
        //           },
        //           );
        //       }
        //     },
        //   ),
        // )
        );
  }
}
