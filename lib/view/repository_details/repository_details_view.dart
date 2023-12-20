import 'package:bs23_flutter_task_101/view/repository_details/repository_details_controller.dart';
import 'package:bs23_flutter_task_101/view/repository_details/widgets/repo_description_widget.dart';
import 'package:bs23_flutter_task_101/view/repository_details/widgets/repo_header_widget.dart';
import 'package:bs23_flutter_task_101/view/repository_details/widgets/repo_others_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepositoryDetailsView extends StatelessWidget {
  final RepositoryDetailsController _repoDetailsViewController =
      Get.put(RepositoryDetailsController());

  RepositoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_repoDetailsViewController.repoItemDetails.name}",
            style: const TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeaderWidget(),
              const SizedBox(height: 16),
              RepoDescriptionAndLinkWidget(),
              const SizedBox(height: 16),
              RepoOthersWidgets()
            ],
          ),
        ),
      ),
    );
  }
}
