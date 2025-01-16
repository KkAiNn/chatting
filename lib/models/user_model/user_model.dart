/*
 * @Author: wurangkun
 * @Date: 2025-01-16 14:42:53
 * @LastEditTime: 2025-01-16 16:04:59
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\models\user_model\user_model.dart
 * @Description: 
 */
import 'package:flutter_cli/models/education_company/education_company.dart';
import "package:json_annotation/json_annotation.dart";
import 'dart:convert';

part 'user_model.g.dart';

@JsonSerializable()
class UserVo {
  ///地址详情
  @JsonKey(name: "address")
  String? address;

  ///头像地址
  @JsonKey(name: "avatar")
  String? avatar;

  ///生日
  @JsonKey(name: "birthday")
  String? birthday;

  ///公司Id
  @JsonKey(name: "companyId")
  String? companyId;

  ///企业类型
  @JsonKey(name: "companyType")
  int? companyType;

  ///创建者
  @JsonKey(name: "createBy")
  String? createBy;

  ///创建时间
  @JsonKey(name: "createTime")
  String? createTime;

  ///证件
  @JsonKey(name: "credentialsNo")
  String? credentialsNo;

  ///删除标志（0代表存在 2代表删除）
  @JsonKey(name: "delFlag")
  int? delFlag;

  ///教育局对象
  @JsonKey(name: "education")
  EducationCompany? education;

  ///教育局id
  @JsonKey(name: "educationId")
  String? educationId;

  ///用户邮箱
  @JsonKey(name: "email")
  String? email;

  ///最后登录时间
  @JsonKey(name: "loginDate")
  String? loginDate;

  ///最后登录IP
  @JsonKey(name: "loginIp")
  String? loginIp;

  ///商户id
  @JsonKey(name: "merchantId")
  String? merchantId;

  ///手机号码
  @JsonKey(name: "mobile")
  String? mobile;

  ///用户昵称
  @JsonKey(name: "nickName")
  String? nickName;

  ///密码
  @JsonKey(name: "password")
  String? password;

  ///区域 如省市区
  @JsonKey(name: "region")
  String? region;

  ///备注
  @JsonKey(name: "remark")
  String? remark;

  ///用户性别（0男 1女 2未知）
  @JsonKey(name: "sex")
  int? sex;

  ///帐号状态（0正常 1停用）
  @JsonKey(name: "status")
  int? status;

  ///孩子数量
  @JsonKey(name: "studentSize")
  int? studentSize;

  ///上级姓名
  @JsonKey(name: "superiorName")
  String? superiorName;

  ///上级userId
  @JsonKey(name: "superiorUserId")
  String? superiorUserId;

  ///是否发送过修改昵称、头像的任务  0：没有 1：发过
  @JsonKey(name: "taskFlag")
  int? taskFlag;

  ///更新者
  @JsonKey(name: "updateBy")
  String? updateBy;

  ///更新时间
  @JsonKey(name: "updateTime")
  String? updateTime;

  ///用户ID
  @JsonKey(name: "userId")
  String? userId;

  ///用户账号
  @JsonKey(name: "userName")
  String? userName;

  ///用户类型（0系统用户,1:教职工,2:家长,3:仟籽后台,4:配送商,5:经销商,6:供应商,7:教育局后台）
  @JsonKey(name: "userType")
  int? userType;

  ///用户类型（0系统用户,1:教职工,2:家长,3:仟籽后台,4:配送商,5:经销商,6:供应商,7:教育局后台）
  @JsonKey(name: "token")
  String? token;

  UserVo({
    this.address,
    this.avatar,
    this.birthday,
    this.companyId,
    this.companyType,
    this.createBy,
    this.createTime,
    this.credentialsNo,
    this.delFlag,
    this.education,
    this.educationId,
    this.email,
    this.loginDate,
    this.loginIp,
    this.merchantId,
    this.mobile,
    this.nickName,
    this.password,
    this.region,
    this.remark,
    this.sex,
    this.status,
    this.studentSize,
    this.superiorName,
    this.superiorUserId,
    this.taskFlag,
    this.updateBy,
    this.updateTime,
    this.userId,
    this.userName,
    this.userType,
    this.token,
  });

  factory UserVo.fromJson(Map<String, dynamic> json) => _$UserVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserVoToJson(this);
}
