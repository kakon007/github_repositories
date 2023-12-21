import 'package:bs23_flutter_task_101/configs/server.dart';
import 'package:bs23_flutter_task_101/model/local_db_model/repo_list_model.dart';
import 'package:bs23_flutter_task_101/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  Server.baseURL = 'https://api.github.com';
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(RepoListHiveModelAdapter());
  await Hive.openBox<RepoListHiveModel>('repoItems');
  runApp(const MyApp());
}
