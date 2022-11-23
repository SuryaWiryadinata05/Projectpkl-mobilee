import 'package:get/get.dart';
import 'package:project/app/controller/controller_project_categories.dart';
import 'package:project/app/core/data/providers/task/provider.dart';
import 'package:project/app/core/data/services/storage/repository.dart';
import 'package:project/app/controller/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(taskprovider: TaskProvider()),
      ),
    );
    Get.lazyPut(
      () => ProjectCategoriesController(),
    );
  }
}
