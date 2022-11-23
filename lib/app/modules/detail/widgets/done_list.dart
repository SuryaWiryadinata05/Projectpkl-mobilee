import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/core/values/colors.dart';
import 'package:project/app/controller/controller.dart';
import 'package:get/get.dart';

class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.doneTodos.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0.wp,
                  horizontal: 4.0.wp,
                ),
                child: Text(
                  'Completed (${homeCtrl.doneTodos.length})',
                  style: TextStyle(
                      fontSize: 14.0.sp,
                      color: Colors.grey,
                      fontFamily: 'Buattask2'),
                ),
              ),
              ...homeCtrl.doneTodos
                  .map((element) => Dismissible(
                        key: ObjectKey(element),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => homeCtrl.deleteDoneTodo(element),
                        background: Container(
                          color: Colors.red.withOpacity(0.8),
                          alignment: Alignment.centerRight,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.0.wp,
                            horizontal: 9.0.wp,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.done,
                                  color: blue,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                element['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14.0.sp,
                                    fontFamily: 'Completed',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ],
          )
        : Container());
  }
}
