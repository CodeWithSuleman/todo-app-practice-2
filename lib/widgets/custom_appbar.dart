import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? backgroundColor;

  const CustomAppBar({super.key, this.title, this.backgroundColor});
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _searching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: widget.title,
            backgroundColor: widget.backgroundColor,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _searching = !_searching;
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
            bottom: _searching
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(56),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ))
                : null));
  }
}
