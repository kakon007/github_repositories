import 'package:bs23_flutter_task_101/view/home/widgets/repo_list_items.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RepoListItem(),
      ),
    );
  }
}
