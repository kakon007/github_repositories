import 'package:bs23_flutter_task_101/utils/colors_utils.dart';
import 'package:bs23_flutter_task_101/view/repository_details/repository_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RepoOthersWidgets extends StatelessWidget {
  final RepositoryDetailsController _repoDetailsViewController = Get.find();

  RepoOthersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Others",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.star,
            'Stars',
            _repoDetailsViewController.repoItemDetails.stargazersCount
                .toString()),
        const SizedBox(height: 8),
        _getContrainer(Icons.call_split, 'Forks',
            _repoDetailsViewController.repoItemDetails.forksCount.toString()),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.remove_red_eye,
            'Watchers',
            _repoDetailsViewController.repoItemDetails.watchersCount
                .toString()),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.error,
            'Open Issues',
            _repoDetailsViewController.repoItemDetails.openIssuesCount
                .toString()),
        const SizedBox(height: 8),
        _getContrainer(Icons.code, 'Language',
            _repoDetailsViewController.repoItemDetails.language ?? ''),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.calendar_today,
            'Created At',
            DateFormat('MM-dd-yyyy')
                .format(_repoDetailsViewController.repoItemDetails.createdAt ??
                    DateTime.now())
                .toString()),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.calendar_today,
            'Updated At',
            DateFormat('MM-dd-yyyy')
                .format(_repoDetailsViewController.repoItemDetails.updatedAt ??
                    DateTime.now())
                .toString()),
        const SizedBox(height: 8),
        _getContrainer(
            Icons.calendar_today,
            'Pushed At',
            DateFormat('MM-dd-yyyy')
                .format(_repoDetailsViewController.repoItemDetails.pushedAt ??
                    DateTime.now())
                .toString()),
      ],
    );
  }

  Widget _getContrainer(IconData? icon, String? title, String? value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorUtils.blue700)),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorUtils.blue700,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Text(
            value ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
