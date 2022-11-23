import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/core/data/services/storage/services.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/binding/binding.dart';
import 'package:project/app/modules/home/view.dart';
import 'package:project/screen/drawer_widget.dart';
import 'package:project/screen/splashscreen/splash_screen_logo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project',
      home: const SplashLogo(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;

  @override
  void initState() {
    super.initState();

    // opendrawer();
    closeDrawer();
  }

  void opendrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [BuildDrawer(), BuildPage()]),
    );
  }

  Widget BuildDrawer() {
    return SafeArea(child: DrawerWidget());
  }

  Widget BuildPage() {
    final double xOffset = 45.0.wp;
    final double yOffset = 20.0.wp;
    final double scaleFactor = 0.6.wp;

    return Container(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: HomePage());
  }
}
