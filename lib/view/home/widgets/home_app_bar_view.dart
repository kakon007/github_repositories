import 'package:bs23_flutter_task_101/shared/helper/common/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeViewController _homeViewController = Get.find();

  HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: UIHelper().drawAppbarTitle(title: "GitHub Repositories"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_sharp),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
