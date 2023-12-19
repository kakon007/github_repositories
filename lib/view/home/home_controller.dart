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
    var response =
        await RepositoriesApiService().getGitHubSearchedRepositories();
    if (response != null) {
      listOfRepoItems.value = response.items!;
    } else {
      listOfRepoItems.value = [];
    }
    isLoading.value = false;
  }
}
