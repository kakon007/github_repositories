import 'package:bs23_flutter_task_101/data/repositories_api_service.dart';
import 'package:bs23_flutter_task_101/model/gitHub_repository_model.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  RxList<Item> listOfRepoItems = RxList<Item>();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchGitHubRepositories();
  }

  void fetchGitHubRepositories() async {
    isLoading.value = true;
    Map<String, dynamic> queryParameters = {
      "q": "Flutter",
      "page": "0",
      "per_page": "25",
      "sort": "stars",
      "order": "desc"
    };
    var response = await RepositoriesApiService()
        .getGitHubSearchedRepositories(queryParams: queryParameters);
    if (response != null) {
      listOfRepoItems.value = response.items!;
    } else {
      listOfRepoItems.value = [];
    }
    isLoading.value = false;
  }
}
