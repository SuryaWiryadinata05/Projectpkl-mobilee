import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/data/drawer_items.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
        children: DrawerItems.all
            .map((item) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  leading: Icon(item.icon, color: Colors.white),
                  title: Text(
                    item.title,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  onTap: () {},
                ))
            .toList());
  }
}
