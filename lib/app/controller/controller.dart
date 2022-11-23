import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/core/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});
  final formkey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final createCtrl = TextEditingController();
  final deadlineCtrl = TextEditingController();
  final deskripsiCtrl = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final tasks = <Task>[].obs;
  final task = Rx<Task?>(null);
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;
  var selectedDate = DateTime.now().obs;
  var selectedDatee = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    editCtrl.dispose();
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeTask(Task? select) {
    task.value = select;
  }

  void changeTodos(List<dynamic> select) {
    doingTodos.clear();
    doneTodos.clear();
    for (int i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo['done'];
      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  bool addlogin(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    if (containeTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    int oldIdx = tasks.indexOf(task);
    tasks[oldIdx] = newTask;
    tasks.refresh();
    return true;
  }

  bool containeTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }

  bool addTodo(
    String title,
  ) {
    var todo = {'title': title, 'done': false};
    if (doingTodos
        .any((element) => mapEquals<String, dynamic>(todo, element))) {
      return false;
    }
    var doneTodo = {'title': title, 'done': true};
    if (doneTodos
        .any((element) => mapEquals<String, dynamic>(doneTodo, element))) {
      return false;
    }

    doingTodos.add(todo);
    return true;
  }

  void updateTodos() {
    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([
      ...doingTodos,
      ...doneTodos,
    ]);

    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void doneTodo(
    String title,
  ) {
    var doingTodo = {'title': title, 'done': false};
    int index = doingTodos.indexWhere(
        (element) => mapEquals<String, dynamic>(doingTodo, element));
    doingTodos.removeAt(index);
    var doneTodo = {'title': title, 'done': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }

  chooseDataCreate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Select DOB',
        cancelText: 'Tutup',
        confirmText: 'Konfirmasi',
        errorFormatText: 'Masukan Data Yang Valid',
        errorInvalidText: 'Masukan Data Sesuai Range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Bulan/Tanggal/Tahun',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 10))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  chooseDataDeadline() async {
    DateTime? pickedDatee = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDatee.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Select DOB',
        cancelText: 'Tutup',
        confirmText: 'Konfirmasi',
        errorFormatText: 'Masukan Data Yang Valid',
        errorInvalidText: 'Masukan Data Sesuai Range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Bulan/Tanggal/Tahun',
        selectableDayPredicate: disableDate);
    if (pickedDatee != null && pickedDatee != selectedDatee.value) {
      selectedDatee.value = pickedDatee;
    }
  }

  void deleteDoneTodo(dynamic doneTodo) {
    int index = doneTodos
        .indexWhere((element) => mapEquals<String, dynamic>(doneTodo, element));
    doneTodos.removeAt(index);
    doneTodos.refresh();
  }

  bool isTodosEmpty(Task task) {
    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodo(Task task) {
    var res = 0;
    for (int i = 0; i < task.todos!.length; i++) {
      if (task.todos![i]['done'] == true) {
        res += 1;
      }
    }
    return res;
  }

  void snackBarError(String msg) {
    Get.snackbar('Error', msg,
        duration: const Duration(
          seconds: 3,
        ),
        icon: const Icon(
          Icons.error,
          color: Color.fromARGB(255, 230, 80, 70),
          size: 30,
        ),
        boxShadows: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.white54,
            blurRadius: 5,
          ),
        ]);
  }

  snackBarError2(String msg) {
    Get.snackbar('Error', msg,
        duration: const Duration(
          seconds: 1,
        ),
        icon: const Icon(
          Icons.error,
          color: Color.fromARGB(255, 230, 80, 70),
          size: 30,
        ),
        boxShadows: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.white54,
            blurRadius: 5,
          ),
        ]);
  }

  snackBarError3(String msg) {
    Get.snackbar('Error', msg,
        duration: const Duration(
          seconds: 1,
        ),
        titleText: Text('Mohon Diisi Pembuatan Tugas Kamu'),
        icon: const Icon(
          Icons.error,
          color: Color.fromARGB(255, 230, 80, 70),
          size: 30,
        ),
        boxShadows: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            color: Colors.white54,
            blurRadius: 5,
          ),
        ]);
  }

  void snackBarSucccess(String msg) {
    Get.snackbar(
      'Success',
      msg,
      duration: const Duration(
        seconds: 3,
      ),
      icon: const Icon(
        Icons.check_box,
        color: Color.fromARGB(255, 122, 236, 68),
        size: 30,
      ),
    );
  }
}
