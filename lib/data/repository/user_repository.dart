import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/screen/login/auth/models/login_response.dart';

class UserRepository {
  Dio _dio = Dio();

  Future<Either<String, LoginResponse>> getAllUserData(
      {required LoginResponse loginresponse}) async {
    Response _response;
     try {
      _response = await _dio.post(
          "http://pkl-assalam.4vmapps.com/api/auth/login",
          data: loginresponse.toJson());
          if(_response.statusCode == 200){
            
          }
      print(_response.statusCode );

      String _result = _response.data.toString();
      LoginResponse _loginResp = LoginResponse.fromJson(_response.data);
      return right(_loginResp);
    } on DioError catch (e) {
      // contoh Menggunakan if
      // if(e.type == DioErrorType.response){}
      print('======= Status Code ========');
      print(e.response!.statusCode);
      print('====== Headers =========');
      print(e.response!.headers);
      print('====== Data ===========');
      print(e.response!.data);

      String errormessage = e.response!.data.toString();
      String rightmessage = e.response!.data.toString();

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
