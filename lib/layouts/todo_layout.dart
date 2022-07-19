import 'package:flutter/material.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({Key? key}) : super(key: key);

  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
