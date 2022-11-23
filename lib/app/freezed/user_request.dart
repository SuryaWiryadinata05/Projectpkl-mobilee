import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project/app/freezed/user_request.dart';

part 'user_request.freezed.dart';

@freezed
abstract class UserRequest with _$UserRequest {
  const factory UserRequest.requestData({
    String? username,
    String? password,
  }) = RequestData;
}
