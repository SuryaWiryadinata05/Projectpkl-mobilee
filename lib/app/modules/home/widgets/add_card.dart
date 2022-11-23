import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/app/core/data/models/task.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/core/values/colors.dart';
import 'package:project/app/controller/controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../widgets/icons.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> with SingleTickerProviderStateMixin {
  final homeCtrl = Get.find<HomeController>();
  // AnimationController? controller;
  // Animation? animation;
  // Color? color;
  // @override
  // @mustCallSuper
  // void initState() {
  //   super.initState();
  //   controller =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  //   animation =
  //       ColorTween(begin: Colors.red, end: Color.fromARGB(255, 67, 66, 66))
  //           .animate(controller!);

  //   animation!.addListener(() {
  //     setState(() {
  //       color = animation!.value;
  //     });
  //   });

  //   controller!.forward();
  // }

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(2.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.only(top: 1.3.wp),
              radius: 5,
              title: '',
              content: Form(
                key: homeCtrl.formkey,
                child: Flexible(
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Column(children: [
                          Text(
                            'Tipe Tugas',
                            style: TextStyle(
                                fontFamily: 'Buattask2', fontSize: 17.0.sp),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: TextFormField(
                              controller: homeCtrl.editCtrl,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.title),
                                labelText: 'Judul Tugas',
                                labelStyle: TextStyle(
                                  fontFamily: 'Buattask2',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              validator: ((value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Mohon Diisi Pengisian Tugas Kamu';
                                }
                                return null;
                              }),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: TextFormField(
                              maxLines: 3,
                              controller: homeCtrl.deskripsiCtrl,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.title),
                                hintText: 'Deskripsi',
                                hintStyle: TextStyle(
                                  fontFamily: 'Buattask2',
                                  fontWeight: FontWeight.bold,
                                ),

                                // labelText: 'Deskripsi',
                                // labelStyle: TextStyle(
                                //   fontFamily: 'Buattask2',
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              validator: ((value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Mohon Diisi Pengisian Tugas Kamu';
                                }
                                return null;
                              }),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.0.wp),
                            child: TextFormField(
                              controller: homeCtrl.createCtrl,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today_rounded),
                                  labelText: 'Tanggal Pembuatan',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Buattask2',
                                      fontWeight: FontWeight.bold)),

                              // onTap: () {
                              //   homeCtrl.chooseDataCreate();
                              // },
                              validator: ((value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Mohon Diisi Tanggal Pembuatan Kamu';
                                }
                                return null;
                              }),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.0.wp),
                            child: TextFormField(
                              controller: homeCtrl.deadlineCtrl,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today_rounded),
                                  labelText: 'Tanggal Deadline',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Buattask2',
                                      fontWeight: FontWeight.bold)),

                              // onTap: () {
                              //   homeCtrl.chooseDataCreate();
                              // },
                              validator: ((value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Mohon Diisi Tanggal Pendeadlinenan Kamu';
                                }
                                return null;
                              }),
                            ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 3.0.wp),
                          //   child: TextField(
                          //     controller: homeCtrl.createCtrl,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Icons.calendar_today_rounded),
                          //       labelText: 'selected date',
                          //     ),
                          //     onTap: () {
                          //       homeCtrl.chooseDataCreate();
                          //       setState(() {
                          //         homeCtrl.createCtrl.text =
                          //             homeCtrl.chooseDataCreate();
                          //       });
                          //     },
                          //   ),
                          // ),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 3.0.wp),
                          //   child: TextField(
                          //     controller: homeCtrl.deadlineCtrl,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Icons.calendar_today_rounded),
                          //       labelText: 'selected date',
                          //     ),
                          //     onTap: () {
                          //       homeCtrl.chooseDataDeadline();
                          //       setState(() {
                          //         homeCtrl.deadlineCtrl.text =
                          //             homeCtrl.chooseDataDeadline();
                          //       });
                          //     },
                          //   ),
                          // ),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 3.0.wp),
                          //   child: ElevatedButton(
                          //       onPressed: () {
                          //         if (homeCtrl.formkey.currentState!.validate()) {
                          //           if (homeCtrl.selectedDate.value == null) {
                          //             EasyLoading.showError('Mohon Diisi');
                          //           }
                          //         }
                          //         homeCtrl.chooseDataCreate();
                          //       },
                          //       child: const Text('Created')),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     top: 1.0.wp,
                          //   ),
                          //   child: ElevatedButton(
                          //       onPressed: () {
                          //         if (homeCtrl.formkey.currentState!.validate()) {
                          //           if (homeCtrl.selectedDatee.value == null) {
                          //             EasyLoading.showError('Mohon Diisi');
                          //           }
                          //         }

                          //         homeCtrl.chooseDataDeadline();
                          //       },
                          //       child: const Text('Deadline')),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.0.wp),
                            child: Wrap(
                                spacing: 2.0.wp,
                                children: icons
                                    .map((e) => Obx(() {
                                          final index = icons.indexOf(e);
                                          return ChoiceChip(
                                            selectedColor: Colors.grey[200],
                                            pressElevation: 0,
                                            backgroundColor: Colors.white,
                                            label: e,
                                            selected:
                                                homeCtrl.chipIndex.value ==
                                                    index,
                                            onSelected: (bool selected) {
                                              homeCtrl.chipIndex.value =
                                                  selected ? index : 0;
                                            },
                                          );
                                        }))
                                    .toList()),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              minimumSize: const Size(150, 40),
                            ),
                            onPressed: () {
                              if (homeCtrl.formkey.currentState!.validate()) {
                                int icon = icons[homeCtrl.chipIndex.value]
                                    .icon!
                                    .codePoint;
                                String? color = icons[homeCtrl.chipIndex.value]
                                    .color!
                                    .toHex();

                                var task = Task(
                                  title: homeCtrl.editCtrl.text,
                                  icon: icon,
                                  color: color,
                                  date: homeCtrl.createCtrl.text,
                                  dateline: homeCtrl.deadlineCtrl.text,
                                  deskripsi: homeCtrl.deskripsiCtrl.text,
                                );
                                Get.back();
                                homeCtrl.addTask(task)
                                    ? EasyLoading.showSuccess('Create Success',
                                        duration: Duration(milliseconds: 70))
                                    : homeCtrl.snackBarError(
                                        'Error Jangan Duplicasi');
                              }
                            },
                            child: const Text(
                              "Konfirmasi",
                              style: TextStyle(
                                  fontFamily: 'Tipe Tugas',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ]),
                      ]),
                ),
              ));
          homeCtrl.editCtrl.clear();
          homeCtrl.createCtrl.clear();
          homeCtrl.deadlineCtrl.clear();
          homeCtrl.deskripsiCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
            color: Colors.black,
            dashPattern: const [8, 4],
            child: Center(
              child: Icon(
                Icons.add,
                size: 10.0.wp,
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
