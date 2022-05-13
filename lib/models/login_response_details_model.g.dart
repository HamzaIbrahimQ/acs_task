// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDetailsModel _$LoginResponseDetailsModelFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDetailsModel(
      userId: json['UserID'] as int?,
      companyId: json['CompanyId'] as int?,
      companyBranchId: json['CompanyBranchId'] as int?,
      groupId: json['GroupId'] as int?,
      companyIds: json['CompanyIds'] as int?,
      userName: json['Username'] as String?,
      oldPassword: json['OldPassword'] as String?,
      newPassword: json['NewPassword'] as String?,
      firstName: json['FirstName'] as String?,
      midName: json['MidName'] as String?,
      lastName: json['LastName'] as String?,
      email: json['Email'] as String?,
      address: json['Address'] as String?,
      phoneNo: json['PhoneNo'] as String?,
      userPermission: json['UserPermission'] as String?,
      isPasswordReset: json['IsPasswordReset'] as bool?,
      groupOfUserID: json['GroupOfUserID'] as int?,
      roleId: json['Role_Id'] as int?,
      type: json['Type'] as int?,
      isActive: json['IsActive'] as bool?,
      dateOfBirth: json['DateOfBirth'] as String?,
      departmentId: json['DepartmentId'] as int?,
      jobTitle: json['JobTitle'] as String?,
      gender: json['Gender'] as int?,
      profilePicture: json['ProfilePicture'] as String?,
      jobDescription: json['JobDescription'] as String?,
      confirmPassword: json['ConfirmPassword'] as String?,
      passwordLastModifyDate: json['PasswordLastModifyDate'] as String?,
      lastLoginDate: json['LastLoginDate'] as String?,
      colGroupsOfPermission: json['ColGroupsOfPermission'] as String?,
      colDepartment: json['ColDepartment'] as String?,
      loCompany: json['loCompany'] as String?,
      refDepartment: json['RefDepartment'] as String?,
      name: json['Name'] as String?,
      userGroupId: json['UserGroupId'] as int?,
    );

Map<String, dynamic> _$LoginResponseDetailsModelToJson(
        LoginResponseDetailsModel instance) =>
    <String, dynamic>{
      'UserID': instance.userId,
      'CompanyId': instance.companyId,
      'CompanyBranchId': instance.companyBranchId,
      'GroupId': instance.groupId,
      'CompanyIds': instance.companyIds,
      'Username': instance.userName,
      'OldPassword': instance.oldPassword,
      'NewPassword': instance.newPassword,
      'FirstName': instance.firstName,
      'MidName': instance.midName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'Address': instance.address,
      'PhoneNo': instance.phoneNo,
      'UserPermission': instance.userPermission,
      'IsPasswordReset': instance.isPasswordReset,
      'GroupOfUserID': instance.groupOfUserID,
      'Role_Id': instance.roleId,
      'Type': instance.type,
      'IsActive': instance.isActive,
      'DateOfBirth': instance.dateOfBirth,
      'DepartmentId': instance.departmentId,
      'JobTitle': instance.jobTitle,
      'Gender': instance.gender,
      'ProfilePicture': instance.profilePicture,
      'JobDescription': instance.jobDescription,
      'ConfirmPassword': instance.confirmPassword,
      'PasswordLastModifyDate': instance.passwordLastModifyDate,
      'LastLoginDate': instance.lastLoginDate,
      'ColGroupsOfPermission': instance.colGroupsOfPermission,
      'ColDepartment': instance.colDepartment,
      'loCompany': instance.loCompany,
      'RefDepartment': instance.refDepartment,
      'Name': instance.name,
      'UserGroupId': instance.userGroupId,
    };
