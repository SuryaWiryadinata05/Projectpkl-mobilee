import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/modules/detail/widgets/doing_list.dart';
import 'package:project/app/modules/detail/widgets/done_list.dart';
import 'package:project/app/controller/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../screen/login/constants.dart';

class DetailPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = homeCtrl.task.value!;
    var color = HexColor.fromHex(task.color);
    return Container(
      width: double.infinity,
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(colors: [
      //       Colorpalette.primaryDarkcolor,
      //       Colorpalette.underlineTextField
      //     ]),
      //     borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Center(
        child: Form(
          key: homeCtrl.formkey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                          homeCtrl.updateTodos();
                          homeCtrl.changeTask(null);
                          homeCtrl.editCtrl.clear();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 217, 218, 220),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            color: Colors.blueGrey[300]!,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        IconData(task.icon, fontFamily: 'MaterialIcons'),
                        color: color,
                      ),
                    ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 227, 230, 235),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent),
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.inner,
                              color: Colors.blueGrey[300]!,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'Bebasnue'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10.0.wp, top: 6.0.wp, right: 10.0.wp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 210, 231, 223),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.inner,
                                color: Colors.blueGrey[300]!,
                                blurRadius: 5,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Text('Deskripsi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0,
                                  fontFamily: 'Buattask')),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 247, 204),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent),
                              boxShadow: [
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  color: Colors.blueGrey[300]!,
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: AutoSizeText(
                              '${task.deskripsi?.toLowerCase()}',
                              style: const TextStyle(
                                  fontSize: 13.0,
                                  color: kTextColor,
                                  fontFamily: 'Buattask2'),
                              minFontSize: 10,
                              stepGranularity: 10,
                              maxLines: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 246, 222, 204),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            color: Colors.blueGrey[300]!,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Created',
                            style: TextStyle(
                                fontFamily: 'DetailTask', fontSize: 12.0.sp),
                          ),
                          SizedBox(
                            height: 1.0.wp,
                          ),
                          Text(
                            '${task.date}',
                            style: TextStyle(
                              fontFamily: 'Taskcount',
                              fontSize: 9.0.sp,
                            ),
                            // DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            // style: const TextStyle(
                            //     fontFamily: 'Taskcount', fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 246, 222, 204),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.inner,
                            color: Colors.blueGrey[300]!,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Deadline',
                            style: TextStyle(
                                fontFamily: 'DetailTask', fontSize: 12.0.sp),
                          ),
                          SizedBox(
                            height: 1.0.wp,
                          ),
                          Text(
                            '${task.dateline}',
                            style: TextStyle(
                                fontFamily: 'Taskcount', fontSize: 9.0.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                var totalTodos =
                    homeCtrl.doingTodos.length + homeCtrl.doneTodos.length;
                return Padding(
                  padding: EdgeInsets.only(
                    top: 3.0.wp,
                    left: 14.0.wp,
                    right: 16.0.wp,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$totalTodos Tugas',
                        style: TextStyle(
                            fontSize: 11.0.sp,
                            color: const Color.fromARGB(255, 57, 56, 56),
                            fontFamily: 'Taskcount'),
                      ),
                      SizedBox(width: 3.0.wp),
                      Expanded(
                        child: StepProgressIndicator(
                          totalSteps: totalTodos == 0 ? 1 : totalTodos,
                          currentStep: homeCtrl.doneTodos.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [color.withOpacity(0.5), color]),
                          unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.grey[300]!, Colors.grey[300]!]),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2.0.wp,
                  horizontal: 5.0.wp,
                ),
                child: TextFormField(
                  controller: homeCtrl.editCtrl,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    prefixIcon: Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.lime[100],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (homeCtrl.formkey.currentState!.validate()) {
                          var success = homeCtrl.addTodo(
                            homeCtrl.editCtrl.text,
                          );

                          if (success) {
                            EasyLoading.showSuccess(
                                'Item Pekerjaan Berhasil Dibuat');
                          } else {
                            homeCtrl
                                .snackBarError('Item Pekerjaan Telah Ada !');
                          }
                          homeCtrl.editCtrl.clear();
                          homeCtrl.createCtrl.clear();
                          homeCtrl.deadlineCtrl.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.done,
                      ),
                    ),
                  ),
                  validator: ((value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mohon Diisi Terlebih Dahulu Kawan';
                    }
                    return null;
                  }),
                ),
              ),
              DoingList(),
              DoneList()
            ],
          ),
        ),
      ),
    );
  }
}
