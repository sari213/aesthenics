

import 'dart:async';

import 'package:aesthenics/api/app_exceptions.dart';
import 'package:aesthenics/data/pref_manager.dart';
import 'package:aesthenics/utils/Constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class ApiBaseHelper {

  final String _baseUrl = "https://fa066f7a4140.ngrok.io/api/";


  Future<dynamic> apiGetRequest(String api) async {
    return await apiCallRequest(Constants.GET, api, "",  false);
  }

  Future<dynamic> apiCallRequest(
      String method, String url, dynamic body, bool returnStatusCode) async {
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = Prefs.getString(Constants.accessTokenStr);
    Dio dio = new Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    dio.options.baseUrl = _baseUrl;
    if (accessToken != null) {
      dio.options.headers[Constants.authorization] = accessToken;
    }
    if (url.contains("cftoken")) {
      dio.options.headers[Constants.clientId] = Prefs.getString(Constants.appId);
      dio.options.headers[Constants.clientSecret] = Prefs.getString(Constants.appSecret);
    }
    var responseJson;
    Response response;
  //  print(url);
    try {
      switch (method) {
        case Constants.GET:
          response = await dio.get(url);
          break;
        case Constants.POST:
          response = await dio.post(url, data: body);
          break;
        case Constants.DELETE:
          response = await dio.delete(url);
          break;
      }
      responseJson = _returnResponse(response, returnStatusCode);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
      //  print(url + e.message.toString());
        responseJson = _returnResponse(e.response, returnStatusCode);
      } else {
        throw FetchDataException(Constants.noInternet);
      }
    }
    return responseJson;
  }
}

dynamic _returnResponse(Response response, bool isStatusCode) {
  switch (response.statusCode) {
    case 200:
    case 202:
      var responseJson;
      if (isStatusCode) {
        responseJson = response.statusCode.toString();
      } else {
        responseJson = response.data;
      }
      return responseJson;
    case 400:
      throw BadRequestException(response.statusCode.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.statusCode.toString());
    default:
      throw FetchDataException(response.statusCode.toString());
  }
}
