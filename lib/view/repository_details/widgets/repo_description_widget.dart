import 'package:bs23_flutter_task_101/mixin.dart';
import 'package:bs23_flutter_task_101/view/repository_details/repository_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepoDescriptionWidget extends StatelessWidget with Mixin {
  final RepositoryDetailsController _repoDetailsViewController = Get.find();

  RepoDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _repoDetailsViewController.listOfRepoItems.description ?? '',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "GitHub",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            // openUrl(context,
            //     _repoDetailsViewController.listOfRepoItems.htmlUrl ?? '');
          },
          child: Text(
            _repoDetailsViewController.listOfRepoItems.htmlUrl ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
