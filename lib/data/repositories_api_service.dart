import 'package:bs23_flutter_task_101/configs/server.dart';
import 'package:bs23_flutter_task_101/service/network/network_service.dart';

import '../model/gitHub_repository_model.dart';

class RepositoriesApiService {
  Future<GitHubRepositoryModel?> getGitHubSearchedRepositories(
      {Map<String, dynamic>? queryParams}) async {
    var response = await NetworkService().networkRequest(
        url: Server.SEARCH_REPOSITORIES,
        queryParameters: queryParams,
        requestType: RequestType.GET);

    if (response != null) {
      return GitHubRepositoryModel.fromJson(response);
    }
    return null;
  }
}
