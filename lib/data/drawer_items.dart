import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/data/model/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: FontAwesomeIcons.home);
  static const task = DrawerItem(title: 'Task', icon: Icons.explore);
  static const detailtask = DrawerItem(title: 'List Task', icon: Icons.message);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.exit_to_app);
  static final List<DrawerItem> all = [home, task, detailtask, logout];
}
