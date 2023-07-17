import 'package:flutter/material.dart';
import 'package:todo_app_practice_2/views/done_scr.dart';
import 'package:todo_app_practice_2/views/settings_scr.dart';
import 'package:todo_app_practice_2/views/todos_scr.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  final screens = [const TodosScreen(), const DoneScreen(), const TodoList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/square.png'),
              ),
              label: "ToDo"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/square2.png'),
              ),
              label: "Done"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/settings.png'),
              ),
              label: "Settings"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
