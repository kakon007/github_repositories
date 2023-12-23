import 'package:bs23_flutter_task_101/mixin.dart';
import 'package:bs23_flutter_task_101/utils/colors_utils.dart';
import 'package:bs23_flutter_task_101/view/repository_details/repository_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RepoDescriptionAndLinkWidget extends StatelessWidget with Mixin {
  final RepositoryDetailsController _repoDetailsViewController = Get.find();

  RepoDescriptionAndLinkWidget({super.key});

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
          _repoDetailsViewController.repoItemsHive.first.description ?? '',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
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
            openUrl(context,
                _repoDetailsViewController.repoItemsHive.first.htmlUrl ?? '');
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorUtils.blue700)),
            child: Text(
              _repoDetailsViewController.repoItemsHive.first.htmlUrl ?? '',
              style: TextStyle(
                fontSize: 16,
                color: ColorUtils.blue700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
