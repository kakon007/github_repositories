import 'package:bs23_flutter_task_101/view/home/home_controller.dart';
import 'package:bs23_flutter_task_101/view/home/widgets/repo_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/home_app_bar_view.dart';

class HomeView extends StatelessWidget {
  final HomeViewController _homeViewController = Get.put(HomeViewController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Obx(() => _homeViewController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : RepoListItem()),
    );
  }
}
