import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_list/modules/archive_tab/archive_screen.dart';
import 'package:todo_list/modules/tasks_tab/tasks_list_screen.dart';
import 'package:todo_list/shared/database/dbhelper.dart';
import '../modules/done_tab/done_screen.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({Key? key}) : super(key: key);


  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {

  int selectedModuleIndex = 0;
  List<Widget> screens = [
    TasksListScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  Database? database;

  @override
  void initState() {
    super.initState();

    DbHelper.init().then((database) {
      this.database = database;
      print('database: $database');
    }).catchError((error){
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment:  AlignmentDirectional.center,
            child: const Text(
              'Todo App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: screens[selectedModuleIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedModuleIndex,
          onTap: (currentIndex){
            setState(() {
              selectedModuleIndex = currentIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
            BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: 'Archived')
          ],
        ),
        floatingActionButton: selectedModuleIndex != 0? null :
        FloatingActionButton(
            onPressed: (){},
          child: Icon(Icons.add),
        ),
    );

  }
}
