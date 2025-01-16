// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
  address: json['address'] as String?,
  avatar: json['avatar'] as String?,
  birthday: json['birthday'] as String?,
  companyId: json['companyId'] as String?,
  companyType: (json['companyType'] as num?)?.toInt(),
  createBy: json['createBy'] as String?,
  createTime: json['createTime'] as String?,
  credentialsNo: json['credentialsNo'] as String?,
  delFlag: (json['delFlag'] as num?)?.toInt(),
  education:
      json['education'] == null
          ? null
          : EducationCompany.fromJson(
            json['education'] as Map<String, dynamic>,
          ),
  educationId: json['educationId'] as String?,
  email: json['email'] as String?,
  loginDate: json['loginDate'] as String?,
  loginIp: json['loginIp'] as String?,
  merchantId: json['merchantId'] as String?,
  mobile: json['mobile'] as String?,
  nickName: json['nickName'] as String?,
  password: json['password'] as String?,
  region: json['region'] as String?,
  remark: json['remark'] as String?,
  sex: (json['sex'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  studentSize: (json['studentSize'] as num?)?.toInt(),
  superiorName: json['superiorName'] as String?,
  superiorUserId: json['superiorUserId'] as String?,
  taskFlag: (json['taskFlag'] as num?)?.toInt(),
  updateBy: json['updateBy'] as String?,
  updateTime: json['updateTime'] as String?,
  userId: json['userId'] as String?,
  userName: json['userName'] as String?,
  userType: (json['userType'] as num?)?.toInt(),
  token: json['token'] as String?,
);

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
  'address': instance.address,
  'avatar': instance.avatar,
  'birthday': instance.birthday,
  'companyId': instance.companyId,
  'companyType': instance.companyType,
  'createBy': instance.createBy,
  'createTime': instance.createTime,
  'credentialsNo': instance.credentialsNo,
  'delFlag': instance.delFlag,
  'education': instance.education,
  'educationId': instance.educationId,
  'email': instance.email,
  'loginDate': instance.loginDate,
  'loginIp': instance.loginIp,
  'merchantId': instance.merchantId,
  'mobile': instance.mobile,
  'nickName': instance.nickName,
  'password': instance.password,
  'region': instance.region,
  'remark': instance.remark,
  'sex': instance.sex,
  'status': instance.status,
  'studentSize': instance.studentSize,
  'superiorName': instance.superiorName,
  'superiorUserId': instance.superiorUserId,
  'taskFlag': instance.taskFlag,
  'updateBy': instance.updateBy,
  'updateTime': instance.updateTime,
  'userId': instance.userId,
  'userName': instance.userName,
  'userType': instance.userType,
  'token': instance.token,
};
