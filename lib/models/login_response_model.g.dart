// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      errorCode: json['ErrorCode'] as int?,
      errorMessage: json['ErrorMessage'] as String?,
      isSuccess: json['IsScusses'] as bool?,
      loginResponseDetails: json['ResponseDetails'] == null
          ? null
          : LoginResponseDetailsModel.fromJson(
              json['ResponseDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'IsScusses': instance.isSuccess,
      'ResponseDetails': instance.loginResponseDetails,
    };
