class TaskModel{
  final String title;
  String? description;
  double progress;
  int taskStatus = TaskStatus.newTask;

  TaskModel(
  {
    required this.title,
    this.description,
    this.progress = 0,
    this.taskStatus = TaskStatus.newTask
  });
}

class TaskStatus{
  static const int newTask = 0;
  static const int inProgressTask = 0;
  static const int doneTask = 0;
  static const int archivedTask = 0;
}