import 'package:bs23_flutter_task_101/configs/app_config.dart';
import 'package:bs23_flutter_task_101/configs/my_theme.dart';
import 'package:bs23_flutter_task_101/mixin.dart';
import 'package:bs23_flutter_task_101/view/home/home_controller.dart';
import 'package:bs23_flutter_task_101/view/repository_details/repository_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors_utils.dart';

class RepoListItem extends StatelessWidget with Mixin {
  final HomeViewController _homeViewController = Get.find();
  RepoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      // ignore: prefer_is_empty
      () => _homeViewController.listOfRepoItems!.length < 0
          ? const Center(child: Text('No Data Found'))
          : RefreshIndicator(
              color: Colors.black,
              backgroundColor: MyTheme.appBarColor,
              onRefresh: () async {
                _homeViewController.canRefresh();
                if (_homeViewController.isRefreshed.value) {
                  _homeViewController.getRefreshData();
                } else {
                  EasyLoading.showInfo("You can refresh after 30 minutes");
                }
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                addAutomaticKeepAlives: true,
                cacheExtent: AppConfig.page_limit.toDouble(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: _homeViewController.scrollController,
                itemCount: _homeViewController.hasMoreData.value
                    ? _homeViewController.listOfRepoItems!.length + 1
                    : _homeViewController.listOfRepoItems!.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      if (index ==
                              _homeViewController.listOfRepoItems!.length &&
                          _homeViewController.hasMoreData.value) {
                        if (_homeViewController.isScrolled.value) {
                          return CupertinoActivityIndicator(
                            color: ColorUtils.blue700,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                      return InkWell(
                        onTap: () {
                          Get.to(() => RepositoryDetailsView(),
                              arguments:
                                  _homeViewController.listOfRepoItems![index]);

                          //todo: Hive Object Error

                          // final data = RepoListHiveModel(
                          //     name: _homeViewController
                          //         .listOfRepoItems![index].name,
                          //     owner: _homeViewController
                          //         .listOfRepoItems![index].owner,
                          //     description: _homeViewController
                          //         .listOfRepoItems![index].description,
                          //     stargazersCount: _homeViewController
                          //         .listOfRepoItems![index].stargazersCount,
                          //     createdAt: _homeViewController
                          //         .listOfRepoItems![index].createdAt,
                          //   );
                          //   final box = Boxes.getData();
                          //   box.add(data);

                          //   data.save().then((value) => {
                          //         Get.to(() => RepositoryDetailsView(),
                          //             arguments: _homeViewController
                          //                 .listOfRepoItems![index])
                          //       });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.grey200)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: getWP(context, 10),
                                    height: getWP(context, 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: _homeViewController
                                                .listOfRepoItems![index]
                                                .owner!
                                                .avatarUrl !=
                                            null
                                        ? CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffE9F0F7),
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    _homeViewController
                                                        .listOfRepoItems![index]
                                                        .owner!
                                                        .avatarUrl!))
                                        : CircleAvatar(
                                            backgroundColor: ColorUtils.grey50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Image.asset(
                                                  "assets/icon/profile_no_image.png"),
                                            ),
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _homeViewController
                                              .listOfRepoItems![index].name ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: ColorUtils.blue25,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                            color: ColorUtils.blue50)),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: ColorUtils.blue700,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _homeViewController
                                        .listOfRepoItems![index].description ??
                                    'DesCription Not Found',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: ColorUtils.blue700,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    _homeViewController.listOfRepoItems![index]
                                            .owner!.login ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // const SizedBox(
                                  //   width: 10,
                                  // ),
                                  // Icon(
                                  //   Icons.fork_right_sharp,
                                  //   color: ColorUtils.blue700,
                                  //   size: 15,
                                  // ),
                                  // const SizedBox(
                                  //   width: 3,
                                  // ),
                                  // Text(
                                  //   "${_homeViewController.listOfRepoItems[index].forksCount!}",
                                  //   style: const TextStyle(
                                  //       fontSize: 14, fontWeight: FontWeight.w500),
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: ColorUtils.blue700,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "${_homeViewController.listOfRepoItems![index].stargazersCount ?? ''}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('MM-dd-yy').format(
                                        _homeViewController
                                                .listOfRepoItems![index]
                                                .updatedAt ??
                                            DateTime.now()),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
              ),
            ),
    );
  }
}
