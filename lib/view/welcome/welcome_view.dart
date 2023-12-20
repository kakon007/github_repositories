import 'dart:async';
import 'dart:io';

import 'package:bs23_flutter_task_101/configs/my_theme.dart';
import 'package:bs23_flutter_task_101/mixin.dart';
import 'package:bs23_flutter_task_101/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with Mixin {
  @override
  void initState() {
    super.initState();

    appInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  appInit() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => {Get.off(() => HomeView())});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isAndroid
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: MyTheme.bgColor,
          body: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icon/bs_logo.png',
              width: getWP(Get.context, 65),
            ),
          ),
        ),
      ),
    );
  }
}
