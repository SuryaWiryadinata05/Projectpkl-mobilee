import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/app/core/utils/extension.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime dateTime = DateTime(2000, 2, 1, 15, 20);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoButton(
      child: Text(
        'Created',
        style: TextStyle(
            fontSize: 13.0.sp,
            color: Colors.black,
            fontFamily: 'TipeTask',
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => SizedBox(
                  height: 250,
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.white,
                    initialDateTime: dateTime,
                    onDateTimeChanged: (DateTime newtime) {
                      setState(
                        () {
                          dateTime = newtime;
                        },
                      );
                    },
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ));
      },
    ));
  }
}
