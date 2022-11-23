import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/controller/controller.dart';
import 'package:lottie/lottie.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 7.0.wp,
              ),
              Lottie.asset(
                "assets/lotties/111240-task.json",
                fit: BoxFit.cover,
                width: 90.0.wp,
              ),
              SizedBox(
                height: 3.0.wp,
              ),
              Text(
                'Tambahkan Tugas  ! ! !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0.sp,
                    fontFamily: 'Buattask2'),
              ),
              SizedBox(
                height: 15.0.wp,
              ),
            ],
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...homeCtrl.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.0.wp,
                          horizontal: 9.0.wp,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.lime[100]),
                                value: element['done'],
                                onChanged: (value) {
                                  homeCtrl.doneTodo(element['title']);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                              child: Text(
                                element['title'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'BuatTask2',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (homeCtrl.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(thickness: 2),
                )
            ],
          )));
  }
}
