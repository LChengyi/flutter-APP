import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHttp {
  Dio? client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if(client==null||context!=this.context){
      this.context = context;
      var options=BaseOptions(
        baseUrl: '',
        connectTimeout: 1000*10,
        receiveTimeout: 1000*3,//jieshou chaoshi 3s
        extra: {'context':context});
      var client = Dio(options);
      this.client = client;
    }
  }
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await client!.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await client!.post(path, data: params, options: options);
  }

// Future<Response<Map<String, dynamic>>> postFormData(String path,
//     [Map<String, dynamic> params, String token]) async {
//   var options = Options(
//       contentType: ContentType.parse('multipart/form-data'),
//       headers: {'Authorization': token});
//   return await _client.post(path, data: params, options: options);
//   }
}