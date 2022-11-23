import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/project/project_categories_response.dart';

class ProjectCategoriesRepo {
  Dio _dio = Dio();

  Future<Either<String, ProjectResponse>> getAllUserData() async {
    Response _response;
    try {
      _response = await _dio.get(
          "http://pkl-assalam.4vmapps.com/api/pm/project/projectItemCategory?limit=10&offset=0");
      print(_response.statusCode);
      print(_response.headers);
      print(_response.statusMessage);
      print(_response.requestOptions);
      print(_response.redirects);
      print(_response.extra);
      print(_response.isRedirect);
      String _result = _response.data.toString();
      ProjectResponse _projectresp = ProjectResponse.fromJson(_response.data);
      return right(_projectresp);
    } on DioError catch (e) {
      // if(e.type == DioErrorType.response){}

      print(e.response!.statusCode);
      String errormessage = e.response!.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          errormessage = e.response!.data['message'];

          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          break;
      }
      return left(errormessage);
    }
  }
}
