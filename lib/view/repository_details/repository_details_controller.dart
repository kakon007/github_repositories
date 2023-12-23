import 'package:bs23_flutter_task_101/box/boxes.dart';
import 'package:bs23_flutter_task_101/model/api_service_model/gitHub_repository_model.dart';
import 'package:bs23_flutter_task_101/model/local_db_model/repo_list_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RepositoryDetailsController extends GetxController {
  //Get Data From API
  Item repoItemDetails = Item();

  //Get Hive Data
  final Box<RepoListHiveModel> repoItemsBox = Boxes.getData();
  List<RepoListHiveModel> get repoItemsHive => repoItemsBox.values.toList();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      repoItemDetails = Get.arguments;
    }
  }

  @override
  void onClose() {
    repoItemsBox.clear();
    super.onClose();
  }
}
