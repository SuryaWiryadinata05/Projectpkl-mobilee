import 'dart:convert';
import 'package:get/get.dart';
import 'package:project/app/core/data/services/storage/services.dart';
import 'package:project/app/core/utils/keys.dart';
import '../../models/task.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromjson(e)));
    return tasks;
  }

  void writeTask(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
