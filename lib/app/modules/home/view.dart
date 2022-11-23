import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/controller/controller.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/modules/home/widgets/add_card.dart';
import 'package:project/app/modules/home/widgets/add_dialog.dart';
import 'package:project/app/modules/home/widgets/sidebar.dart';
import 'package:project/app/modules/home/widgets/task_card.dart';
import 'package:project/screen/login/auth/constants/constants.dart'
    as constants;
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../screen/login/constants.dart';
import '../../../screen/login/login.dart';

class HomePage extends GetView<HomeController> {
  final homeCtrl = Get.find<HomeController>();

  HomePage({
    Key? key,
  }) : super(key: key);
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      key: _scaffoldKEy,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [
            //       Color.fromARGB(255, 206, 208, 214),
            //       Color.fromARGB(255, 219, 222, 244),
            //     ]),
            ),
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0.0, 12.1),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              _scaffoldKEy.currentState?.openDrawer();
                            },
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: ((context) => Sidebarpage())));

                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                          GradientText(
                            "My List.",
                            style: TextStyle(
                                fontSize: 33.0.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Buattask'),
                            colors: [
                              // Colors.white10,
                              // Colors.white24,
                              // Colors.white38,
                              // Colors.white54,
                              // Colors.white
                              Colors.black,
                              Colors.black
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => LoginOnePage(),
                                  transition: Transition.circularReveal,
                                  duration: const Duration(milliseconds: 1500));
                              GetStorage().remove(constants.USER_LOCAL_KEY);
                              // Menggunakan Get Storage Ini DApat Menghapus Semua Data
                              // Termasuk Task" nya => GetStorage().erase();
                              homeCtrl.editCtrl.clear();
                              homeCtrl.createCtrl.clear();
                              homeCtrl.deadlineCtrl.clear();
                              homeCtrl.deskripsiCtrl.clear();
                              homeCtrl.emailController.clear();
                              homeCtrl.passwordController.clear();
                              homeCtrl.changeTask(null);
                            },
                            icon: const Icon(
                              Icons.exit_to_app,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 170,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Material(
                            elevation: 30.0,
                            shadowColor: Colorpalette.primarycolor,
                            color: Color.fromARGB(255, 212, 213, 216),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            // child: TextField(
                            //   // controller: TextEditingController(text: locations[0]),
                            //   cursorColor: Theme.of(context).primaryColor,
                            //   style: dropdownMenuItem,
                            //   decoration: InputDecoration(
                            //       hintText: "Cari",
                            //       hintStyle: TextStyle(
                            //           color: Colors.black38, fontSize: 16),
                            //       prefixIcon: Material(
                            //         elevation: 0.0,
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(30)),
                            //         child: Icon(Icons.search),
                            //       ),
                            //       border: InputBorder.none,
                            //       contentPadding: EdgeInsets.symmetric(
                            //           horizontal: 25, vertical: 13)),
                            // ),

                            // child: Container(
                            //   margin: EdgeInsets.all(2.0.wp),
                            //   decoration:
                            //       const BoxDecoration(color: Colors.white),
                            //   // decoration: BoxDecoration(
                            //   //     borderRadius:
                            //   //         BorderRadius.all(Radius.circular(20))),
                            //   child: search(
                            //       // task: homeCtrl.tasks.first,
                            //       ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0.wp,
            ),
            // Padding(
            //   padding: EdgeInsets.all(4.0.wp),
            //   child: Text(
            //     "My List",
            //     style: TextStyle(
            //         fontSize: 24.0.sp,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Buattask'),
            //   ),
            // ),
            Obx(
              () => GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks
                      .map((element) => LongPressDraggable(
                          data: element,
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (_, __) =>
                              controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: element),
                          ),
                          child: TaskCard(task: element)))
                      .toList(),
                  AddCard()
                ],
              ),
            ),
            WaveWidget(
                config: CustomConfig(gradients: [
                  [
                    Color.fromARGB(255, 180, 235, 229),
                    Color.fromARGB(255, 240, 237, 240)
                  ],
                  [Colors.redAccent, Color.fromARGB(255, 123, 154, 179)],
                  [
                    Color.fromARGB(255, 55, 167, 214),
                    Color.fromARGB(255, 191, 227, 228)
                  ],
                  [
                    Color.fromARGB(255, 19, 172, 175),
                    Color.fromARGB(255, 197, 198, 191)
                  ]
                ],
                    // gradientBegin: Alignment.centerLeft,
                    // gradientEnd: Alignment.centerRight,
                    durations: [
                      3500,
                      19440,
                      10000,
                      6000
                    ], heightPercentages: [
                  0,
                  20,
                  0,
                  10,
                  0,
                  25,
                  0,
                  30
                ]),
                size: Size(1000, 200)),
          ],
        ),
      )),
      floatingActionButton: DragTarget(
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              backgroundColor: controller.deleting.value ? Colors.red : primary,
              onPressed: () {
                if (controller.tasks.isNotEmpty) {
                  Get.to(
                    () => AddDialog(),
                    transition: Transition.size,
                    duration: Duration(milliseconds: 500),
                  );
                } else {
                  homeCtrl.snackBarError(
                    'Tipe Tugas Tidak Ada Coba Untuk membuat Tipe Tugas Nya terlebih Dahulu',
                  );
                }
              },
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Delete Success',
              duration: Duration(milliseconds: 400));
        },
      ),
    );
  }
}

class search extends StatelessWidget {
  // final Task task;
  search({
    Key? key,
    // required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      // items: ['${task.title}'],
      autoValidateMode: AutovalidateMode.always,
    );
  }
}
