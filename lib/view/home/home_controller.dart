import 'package:bs23_flutter_task_101/api_service/repositories_api_service.dart';
import 'package:bs23_flutter_task_101/model/api_service_model/gitHub_repository_model.dart';
import 'package:bs23_flutter_task_101/model/local_db_model/repo_list_model.dart';
import 'package:bs23_flutter_task_101/view/home/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  RxList<Item>? listOfRepoItems = RxList<Item>();
  RxBool isLoading = RxBool(false);
  RxBool hasMoreData = RxBool(true);
  RxBool isScrolled = RxBool(false);
  RxBool isRefreshed = RxBool(false);

  int pageStart = 1;
  int pageCount = 10;
  late ScrollController scrollController;
  List<RepoListHiveModel>? localDataRepoListItem;
  DateTime lastRefreshTime = DateTime.now();

  RxInt indexSortBy = RxInt(3);
  final List<String> listofSortingNames = ["Star Count", "Last Update Date"];

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

  bool canRefresh() {
    isRefreshed.value = DateTime.now().difference(lastRefreshTime) >=
        const Duration(minutes: 30);
    return isRefreshed.value;
  }

  void fetchGitHubRepositories() async {
    Map<String, dynamic> queryParameters = {
      "q": "Flutter",
      "page": pageStart,
      "per_page": pageCount,
      "sort": indexSortBy.value == 3
          ? ''
          : indexSortBy.value == 0
              ? "stars"
              : "updated",
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
            lastRefreshTime = DateTime.now();

            //Adding Data To Local DB Hive//////////

            // final data = RepoListHiveModel(
            //   name: items.name,
            //   owner: items.owner,
            //   description: items.description,
            //   stargazersCount: items.stargazersCount,
            //   createdAt: items.createdAt,
            // );
            // final box = Boxes.getData();
            // box.put('newData', data);
            // localDataRepoListItem =
            //     box.values.toList().cast<RepoListHiveModel>();
            // //    listOfRepoItems!.addAll(dataa);
            // //print('Data Length: ${dataa.length}');
            // data.save();
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

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          title: const Text('Sort By',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          content: FilterWidget(),
        );
      },
    );
  }
}
