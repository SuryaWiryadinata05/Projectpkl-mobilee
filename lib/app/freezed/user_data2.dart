import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data2.freezed.dart';

@freezed
abstract class DataUser2 with _$DataUser2 {
  const factory DataUser2({
    // String? userIdcode,
    // String? avatar,
    // String? name,
    // String? username,
    // String? email,
    // Null? emailVerifiedAt,
    // String? phone,
    // Null? phoneVerifiedAt,
    // Null? note,
    // String? role,
    // int? level,
    // int? systemUser,
    // String? socialauthFacebookId,
    // String? socialauthFacebookToken,
    // Null? socialauthFacebookData,
    // String? socialauthGoogleId,
    // String? socialauthGoogleToken,
    // Null? socialauthGoogleData,
    // int? status,
    int? id,
    int? tenantId,
    int? createdBy,
    int? updatedBy,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) = _Data;
}
