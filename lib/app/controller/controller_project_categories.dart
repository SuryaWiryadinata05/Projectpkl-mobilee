import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/data/model/project/project_categories_response.dart';

class ProjectCategoriesController extends GetxController {
  var projectcategoriess = <ProjectResponse>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjectCategories();
  }

  Future<void> fetchProjectCategories() async {
    final response = await http.get(
      Uri.parse(
          'http://pkl-assalam.4vmapps.com/api/pm/project/projectItemCategory?limit=10&offset=0'),
    );
    print(response.request);
    if (response.statusCode == 200) {
      ProjectResponse _projectresp =
          ProjectResponse.fromJson(jsonDecode(response.body));
      print(response.headers);
      projectcategoriess.add(ProjectResponse(
        status: _projectresp.status,
        data: _projectresp.data,
        errors: _projectresp.errors,
        message: _projectresp.message,
        params: _projectresp.params,
        // data2: _projectresp.data2,
      ));

      isloading.value = true;
    } else {
      Get.snackbar(
        'Error Mising Data',
        'server Response : ${response.statusCode}:${response.reasonPhrase}'
            .toString(),
      );
    }
  }
}
