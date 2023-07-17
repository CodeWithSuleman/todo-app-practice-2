import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  //final Widget leading;
  // final String title;
  // final String subtitle;
   const DoneScreen({super.key,});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Done Data"),));
  }
}
