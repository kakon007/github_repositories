import 'package:bs23_flutter_task_101/model/api_service_model/gitHub_repository_model.dart';
import 'package:get/get.dart';

class RepositoryDetailsController extends GetxController {
  Item listOfRepoItems = Item();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      listOfRepoItems = Get.arguments;
    }
  }
}
