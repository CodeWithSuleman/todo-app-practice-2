import 'package:flutter/material.dart';

class CustomListile extends StatefulWidget {
  final IconData leading;
  final String title;
  final String? subtitle;
  final IconData? trailing;
  final VoidCallback? callback;
  const CustomListile({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.callback,
  });

  @override
  State<CustomListile> createState() => _CustomListileState();
}

class _CustomListileState extends State<CustomListile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(widget.subtitle ?? ""),
        leading: Icon(widget.leading, size: 25),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(widget.trailing),
        ),
      ),
      onTap: widget.callback,
    );
  }
}
