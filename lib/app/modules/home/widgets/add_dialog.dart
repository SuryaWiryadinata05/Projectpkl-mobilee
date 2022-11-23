import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/controller/controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeCtrl.formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeCtrl.editCtrl.clear();
                      homeCtrl.changeTask(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        if (homeCtrl.formkey.currentState!.validate()) {
                          if (homeCtrl.task.value == null) {
                            homeCtrl
                                .snackBarError("Mohon Dipilih Tipe Tugas Nya");
                          } else {
                            var success = homeCtrl.updateTask(
                              homeCtrl.task.value!,
                              homeCtrl.editCtrl.text,
                            );
                            if (success) {
                              EasyLoading.showSuccess(
                                  'Pekerjaan Item Berhasil Ditambahkan');
                              Get.back();
                              homeCtrl.changeTask(null);
                            } else {
                              homeCtrl.snackBarError(
                                  "Tugas Ini Telah Ada Di Dalam Daftar");
                            }
                            homeCtrl.editCtrl.clear();
                          }
                        }
                      },
                      child: Text(
                        'Selesai',
                        style: TextStyle(
                            fontSize: 23.0.sp, fontFamily: 'Buattask'),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
              child: Text(
                'Tugas Baru ?',
                style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Buattask'),
              ),
            ),
            SizedBox(
              height: 3.0.wp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtrl.editCtrl,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!)),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mohon Diisi Pekerjaan Yang Akan Kamu Lakukan';
                  }
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 4.0.wp),
              child: Text(
                'Tambahkan Ke',
                style: TextStyle(
                    fontSize: 14.0.sp,
                    color: Colors.grey,
                    fontFamily: 'Buattask2'),
              ),
            ),
            ...homeCtrl.tasks
                .map((element) => Obx(
                      () => InkWell(
                        onTap: () => homeCtrl.changeTask(element),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0.wp,
                            vertical: 3.0.wp,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconData(
                                  element.icon,
                                  fontFamily: 'MaterialIcons',
                                ),
                                color: HexColor.fromHex(element.color),
                              ),
                              SizedBox(
                                width: 3.0.wp,
                              ),
                              Flexible(
                                child: Text(
                                  element.title,
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'DetailTask'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 2.0.wp,
                              ),
                              if (homeCtrl.task.value == element)
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
