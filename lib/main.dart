import 'package:bs23_flutter_task_101/configs/appDefine.dart';
import 'package:bs23_flutter_task_101/configs/myTheme.dart';
import 'package:bs23_flutter_task_101/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      title: AppDefine.APP_NAME,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            centerTitle: false,
            iconTheme: IconThemeData(color: MyTheme.themeIconDataColor),
            backgroundColor: Colors.white,
            elevation: MyTheme.elevation,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark)),
      ),
      home: HomeView(),
    );
  }
}
