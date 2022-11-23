import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/core/data/providers/task/provider.dart';

class TaskRepository {
  TaskProvider taskprovider;
  TaskRepository({required this.taskprovider});

  List<Task> readTasks() => taskprovider.readTasks();

  void writeTasks(List<Task> tasks) => taskprovider.writeTask(tasks);
}
