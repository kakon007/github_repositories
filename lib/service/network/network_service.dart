import 'dart:convert';
import 'dart:developer';

import 'package:bs23_flutter_task_101/configs/server.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'get_network_config.dart'
    if (dart.library.io) 'mobile_network_config.dart'
    if (dart.library.html) 'web_network_config.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkService {
  final dio = createDio();

  NetworkService._internal();

  static final _singleton = NetworkService._internal();

  factory NetworkService() => _singleton;

  static Dio createDio() {
    Dio dio = getClient()
      ..options = BaseOptions(
        baseUrl: Server.baseURL,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      );

    dio.interceptors.addAll({ErrorInterceptors(dio)});
    dio.interceptors.addAll({AuthInterceptor(dio)});
    dio.interceptors.addAll({Logging(dio)});

    return dio;
  }

  Future<dynamic> networkRequest(
      {Map<String, String>? head,
      required String url,
      Map<String, dynamic>? queryParameters,
      Object? body,
      required RequestType requestType,
      ResponseType? responseType,
      bool showProgress = false,
      Function(double)? getPercentage}) async {
    Response? result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options =
                Options(headers: head ?? header, responseType: responseType);
            result = await dio.get(url,
                queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            Options options =
                Options(headers: head ?? header, responseType: responseType);
            result = await dio.post(
              url,
              queryParameters: queryParameters,
              data: body,
              options: options,
              onSendProgress: (int sent, int total) {
                if (showProgress) {
                  double percent = (sent / total);
                  getPercentage!(percent);
                }
              },
            );
            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header);
            result =
                await dio.delete(url, data: queryParameters, options: options);
            break;
          }
        case RequestType.PUT:
          {
            Options options = Options(headers: header);
            result = await dio.put(url, data: body, options: options);
            break;
          }
        case RequestType.PATCH:
          break;
      }
      if (result != null) {
        return result.data;
      }
      return null;
    } on DioError catch (error) {
      log('My error: ${error.stackTrace}');
      return log(
          'Dio Error Type: ${error.type}, Error Msg: ${error.message ?? 'No msg'}, statusCode: ${error.response}');
    } catch (error) {
      return log(error.toString());
    }
  }
}

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);
  String? accessToken;
  String? refreshToken;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
////For Further Auth Process////

    // accessToken = await PrefMgr.shared.getPrefStr("accessToken");
    // refreshToken = await PrefMgr.shared.getPrefStr("refreshToken");

    if (accessToken != null && accessToken != '') {
      if (kIsWeb) {
        options.extra["withCredentials"] = false;
        options.headers['Accept'] = 'application/json';
        options.headers['Content-Type'] = 'application/json';
        options.headers['Authorization'] = 'Bearer $accessToken';
        options.headers['refreshToken'] = refreshToken;
      } else {
        options.headers['Accept'] = 'application/json';
        options.headers['Content-Type'] = 'application/json';
        options.headers['Authorization'] = 'Bearer $accessToken';
        options.headers['refreshToken'] = refreshToken;
      }
    } else {
      if (kIsWeb) {
        options.extra["withCredentials"] = false;
        options.headers['Accept'] = 'application/json';
        options.headers['Content-Type'] = 'application/json';
      } else {
        options.headers = header;
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kIsWeb) {
      if (accessToken == null) {
        print('MY coookiee: ${response.headers.map['set-cookie']}');
      }
    }
    super.onResponse(response, handler);
  }
}

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path} \n Extras: ${options.extra} \n Headers: ${options.headers} \n Query: ${options.queryParameters} \n Body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} \n res:: ${json.encode(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    EasyLoading.showError(
        'Something went wrong. Please check your network connection and try again later.',
        duration: const Duration(seconds: 8));

    log('ERROR[${err.response!.statusCode ?? 'Unknown Status Code'}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;
  ErrorInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print(err.response!.statusCode);
    EasyLoading.showError(
        'Something went wrong. Please check your network connection and try again later.',
        duration: const Duration(seconds: 8));
    if (err.response!.statusCode == 400 || err.response!.statusCode == 406) {
      print('Inside here error code');
    }
    return handler.next(err);
  }
}

final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
