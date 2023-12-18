import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

Dio getClient() {
  return Dio()..httpClientAdapter = BrowserHttpClientAdapter();
}
