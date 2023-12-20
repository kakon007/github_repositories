import 'package:bs23_flutter_task_101/configs/appConfig.dart';
import 'package:bs23_flutter_task_101/configs/myTheme.dart';
import 'package:bs23_flutter_task_101/view/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../configs/colors_utils.dart';

class RepoListItem extends StatelessWidget {
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
                          return const CupertinoActivityIndicator();
                        } else {
                          return const SizedBox();
                        }
                      }
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ColorUtils.grey200)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                      border:
                                          Border.all(color: ColorUtils.blue50)),
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
                                  '',
                              maxLines: 2,
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
                                  DateFormat('MM-dd-yyyy HH:mm a').format(
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
