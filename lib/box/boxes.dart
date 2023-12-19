import 'package:bs23_flutter_task_101/model/local_db_model/repo_list_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<RepoListHiveModel> getData() =>
      Hive.box<RepoListHiveModel>('repoItems');
}
