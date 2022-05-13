import 'package:acs_task/models/login_response_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'ErrorCode')
  int? errorCode;

  @JsonKey(name: 'ErrorMessage')
  String? errorMessage;

  @JsonKey(name: 'IsScusses')
  bool? isSuccess;

  @JsonKey(name: 'ResponseDetails')
  LoginResponseDetailsModel? loginResponseDetails;

  LoginResponse({
    this.errorCode,
    this.errorMessage,
    this.isSuccess,
    this.loginResponseDetails,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
