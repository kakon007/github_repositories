import 'package:bs23_flutter_task_101/data/repositories_api_service.dart';
import 'package:bs23_flutter_task_101/model/gitHub_repository_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  RxList<Item>? listOfRepoItems = RxList<Item>();
  RxBool isLoading = RxBool(false);
  RxBool hasMoreData = RxBool(true);
  RxBool isScrolled = RxBool(false);

  int pageStart = 1;
  int pageCount = 10;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    appInit();
  }

  void appInit() async {
    scrollController = ScrollController();
    scrollController.addListener(handleScrolling);
    await getRefreshData();
  }

  Future<void> getRefreshData() async {
    pageStart = 1;
    listOfRepoItems!.clear();
    onPageLoad();
  }

  void onPageLoad() {
    isLoading.value = true;
    fetchGitHubRepositories();
  }

  void handleScrolling() {
    isScrolled.value = true;
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        hasMoreData.value) {
      pageStart++;
      fetchGitHubRepositories();
    }
  }

  void fetchGitHubRepositories() async {
    Map<String, dynamic> queryParameters = {
      "q": "Flutter",
      "page": pageStart,
      "per_page": pageCount,
      "sort": "stars",
      "order": "desc"
    };
    var response = await RepositoriesApiService()
        .getGitHubRepositories(queryParams: queryParameters);
    if (response != null) {
      final List<dynamic> itemListFromApiRes = response.items!;

      if (itemListFromApiRes.length < 10) {
        hasMoreData.value = false;
      }
      for (Item items in itemListFromApiRes) {
        if (listOfRepoItems != null) {
          final isExists = listOfRepoItems!.any((e) => items.id == e.id);
          if (!isExists) {
            listOfRepoItems!.add(items);
          }
        } else {
          listOfRepoItems!.add(items);
        }
      }
      isScrolled.value = false;
    } else {
      hasMoreData.value = false;
    }
    isLoading.value = false;
  }
}
