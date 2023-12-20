import 'package:bs23_flutter_task_101/utils/colors_utils.dart';
import 'package:bs23_flutter_task_101/mixin.dart';
import 'package:bs23_flutter_task_101/view/repository_details/repository_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileHeaderWidget extends StatelessWidget with Mixin {
  final RepositoryDetailsController _repoDetailsViewController = Get.find();

  ProfileHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getW(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getWP(context, 18),
            height: getWP(context, 18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: _repoDetailsViewController
                        .listOfRepoItems.owner?.avatarUrl !=
                    null
                ? CircleAvatar(
                    backgroundColor: const Color(0xffE9F0F7),
                    backgroundImage: CachedNetworkImageProvider(
                        _repoDetailsViewController
                            .listOfRepoItems.owner!.avatarUrl!))
                : CircleAvatar(
                    backgroundColor: ColorUtils.grey50,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset("assets/icon/profile_no_image.png"),
                    ),
                  ),
          ),
          const SizedBox(height: 12),
          Text(_repoDetailsViewController.listOfRepoItems.owner?.login ?? '',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          _repoDetailsViewController.listOfRepoItems.updatedAt != null
              ? Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "Last Updated at " +
                      DateFormat('MM-dd-yy HH:mm a').format(
                          _repoDetailsViewController
                                  .listOfRepoItems.updatedAt ??
                              DateTime.now()),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.grey700))
              : const SizedBox(),
        ],
      ),
    );
  }
}
