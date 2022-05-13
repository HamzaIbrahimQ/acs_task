import 'package:json_annotation/json_annotation.dart';

part 'login_response_details_model.g.dart';

@JsonSerializable()
class LoginResponseDetailsModel {
  @JsonKey(name: 'UserID')
  int? userId;

  @JsonKey(name: 'CompanyId')
  int? companyId;

  @JsonKey(name: 'CompanyBranchId')
  int? companyBranchId;

  @JsonKey(name: 'GroupId')
  int? groupId;

  @JsonKey(name: 'CompanyIds')
  int? companyIds;

  @JsonKey(name: 'Username')
  String? userName;

  @JsonKey(name: 'OldPassword')
  String? oldPassword;

  @JsonKey(name: 'NewPassword')
  String? newPassword;

  @JsonKey(name: 'FirstName')
  String? firstName;

  @JsonKey(name: 'MidName')
  String? midName;

  @JsonKey(name: 'LastName')
  String? lastName;

  @JsonKey(name: 'Email')
  String? email;

  @JsonKey(name: 'Address')
  String? address;

  @JsonKey(name: 'PhoneNo')
  String? phoneNo;

  @JsonKey(name: 'UserPermission')
  String? userPermission;

  @JsonKey(name: 'IsPasswordReset')
  bool? isPasswordReset;

  @JsonKey(name: 'GroupOfUserID')
  int? groupOfUserID;

  @JsonKey(name: 'Role_Id')
  int? roleId;

  @JsonKey(name: 'Type')
  int? type;

  @JsonKey(name: 'IsActive')
  bool? isActive;

  @JsonKey(name: 'DateOfBirth')
  String? dateOfBirth;

  @JsonKey(name: 'DepartmentId')
  int? departmentId;

  @JsonKey(name: 'JobTitle')
  String? jobTitle;

  @JsonKey(name: 'Gender')
  int? gender;

  @JsonKey(name: 'ProfilePicture')
  String? profilePicture;

  @JsonKey(name: 'JobDescription')
  String? jobDescription;

  @JsonKey(name: 'ConfirmPassword')
  String? confirmPassword;

  @JsonKey(name: 'PasswordLastModifyDate')
  String? passwordLastModifyDate;

  @JsonKey(name: 'LastLoginDate')
  String? lastLoginDate;

  @JsonKey(name: 'ColGroupsOfPermission')
  String? colGroupsOfPermission;

  @JsonKey(name: 'ColDepartment')
  String? colDepartment;

  @JsonKey(name: 'loCompany')
  String? loCompany;

  @JsonKey(name: 'RefDepartment')
  String? refDepartment;

  @JsonKey(name: 'Name')
  String? name;

  @JsonKey(name: 'UserGroupId')
  int? userGroupId;

  LoginResponseDetailsModel({
    this.userId,
    this.companyId,
    this.companyBranchId,
    this.groupId,
    this.companyIds,
    this.userName,
    this.oldPassword,
    this.newPassword,
    this.firstName,
    this.midName,
    this.lastName,
    this.email,
    this.address,
    this.phoneNo,
    this.userPermission,
    this.isPasswordReset,
    this.groupOfUserID,
    this.roleId,
    this.type,
    this.isActive,
    this.dateOfBirth,
    this.departmentId,
    this.jobTitle,
    this.gender,
    this.profilePicture,
    this.jobDescription,
    this.confirmPassword,
    this.passwordLastModifyDate,
    this.lastLoginDate,
    this.colGroupsOfPermission,
    this.colDepartment,
    this.loCompany,
    this.refDepartment,
    this.name,
    this.userGroupId,
  });

  factory LoginResponseDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDetailsModelToJson(this);
}
