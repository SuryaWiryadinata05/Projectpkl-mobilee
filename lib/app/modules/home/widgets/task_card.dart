import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/modules/detail/view.dart';
import 'package:project/app/controller/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../screen/login/constants.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);
  // Options options = Options(format: Format.hsla, luminosity: Luminosity.light);
  // var color = RandomColor.getColor(options);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    var squareWidth = Get.width - 12.0.wp;

    return GestureDetector(
      onTap: () {
        homeCtrl.changeTask(task);
        homeCtrl.changeTodos(task.todos ?? []);

        Get.to(() => DetailPage(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 340));
      },
      child: Container(
        // child: Container(
        // squareWidth / 2
        width: squareWidth,
        height: squareWidth + 7.0.wp,
        margin: EdgeInsets.all(2.5.wp),
        decoration: BoxDecoration(
          color: Colors.yellow[50],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.blueGrey[300]!,
              blurRadius: 5,
              offset: Offset(0.1, 10.1),
            ),
          ],
        ),
        child: Obx(() {
          var totalTodos =
              homeCtrl.doingTodos.length + homeCtrl.doneTodos.length;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.0.wp),
                child: Container(
                  height: 4.5.wp,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colorpalette.primaryDarkcolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.5.wp),
                child: StepProgressIndicator(
                  totalSteps:
                      homeCtrl.isTodosEmpty(task) ? 1 : task.todos!.length,
                  currentStep: homeCtrl.isTodosEmpty(task)
                      ? 0
                      : homeCtrl.getDoneTodo(task),
                  size: 6,
                  padding: 0,
                  selectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [color.withOpacity(0.5), color]),
                  unselectedGradientColor: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Colors.white]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0.wp, left: 5.0.wp),
                child: Icon(
                  IconData(task.icon, fontFamily: 'MaterialIcons'),
                  size: 27.0.sp,
                  // Harusnya Diisi dengan field color, tapi ngebug jadi hardcode dulu
                  color: color,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 2.0.wp, left: 5.0.wp, right: 6.0.wp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kTextColor,
                          letterSpacing: 0.3.sp,
                          fontFamily: 'DetailTask'),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.0.wp,
                    ),
                    Text(
                      '${task.todos?.length ?? 0} Tugas',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 68, 67, 67),
                          fontSize: 20.0,
                          fontFamily: 'Taskcount'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   const SizedBox(
                      height: 20,
                      child: Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                            fontFamily: 'Buattask'),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    AutoSizeText(
                      '${task.deskripsi?.toLowerCase()}',
                      style: const TextStyle(
                          fontSize: 13.0,
                          color: kTextColor,
                          fontFamily: 'Buattask2'),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 10,
                      stepGranularity: 10,
                      maxLines: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 11.0.wp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Created',
                                style: TextStyle(
                                    fontFamily: 'DetailTask', fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 1.0.wp,
                              ),
                              Text(
                                '${task.date?.toUpperCase()}',
                                style: TextStyle(
                                  fontFamily: 'Taskcount',
                                  fontSize: 12.0,
                                ),
                                // DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                // style: const TextStyle(
                                //     fontFamily: 'Taskcount', fontSize: 13),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Deadline',
                                style: TextStyle(
                                    fontFamily: 'DetailTask', fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 1.0.wp,
                              ),
                              Text(
                                '${task.dateline?.toUpperCase()}',
                                style: TextStyle(
                                    fontFamily: 'Taskcount', fontSize: 12.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
