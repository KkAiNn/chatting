import "package:json_annotation/json_annotation.dart";
import 'dart:convert';

part 'education_company.g.dart';

///教育局对象
///
///EducationCompany
@JsonSerializable()
class EducationCompany {
  ///负责市编码
  @JsonKey(name: "cityCode")
  int? cityCode;

  ///负责区编码
  @JsonKey(name: "countyCode")
  int? countyCode;

  ///创建人
  @JsonKey(name: "createBy")
  String? createBy;

  ///创建时间
  @JsonKey(name: "createTime")
  String? createTime;

  ///删除状态 1启用 2删除
  @JsonKey(name: "deleteStatus")
  int? deleteStatus;

  ///负责人姓名
  @JsonKey(name: "directorName")
  String? directorName;

  ///负责人手机号
  @JsonKey(name: "directorPhone")
  String? directorPhone;

  ///教育局名称
  @JsonKey(name: "educationName")
  String? educationName;

  ///教育局级别 1省 2市 3区
  @JsonKey(name: "educationType")
  int? educationType;

  ///教育局id
  @JsonKey(name: "id")
  String? id;

  ///教育局logo
  @JsonKey(name: "logo")
  String? logo;

  ///负责省编码
  @JsonKey(name: "provinceCode")
  int? provinceCode;

  ///启用状态 1启用 2停用
  @JsonKey(name: "status")
  int? status;

  ///修改人
  @JsonKey(name: "updateBy")
  String? updateBy;

  ///修改时间
  @JsonKey(name: "updateTime")
  String? updateTime;

  EducationCompany({
    this.cityCode,
    this.countyCode,
    this.createBy,
    this.createTime,
    this.deleteStatus,
    this.directorName,
    this.directorPhone,
    this.educationName,
    this.educationType,
    this.id,
    this.logo,
    this.provinceCode,
    this.status,
    this.updateBy,
    this.updateTime,
  });

  factory EducationCompany.fromJson(Map<String, dynamic> json) =>
      _$EducationCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$EducationCompanyToJson(this);
}
