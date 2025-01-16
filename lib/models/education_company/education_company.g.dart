// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationCompany _$EducationCompanyFromJson(Map<String, dynamic> json) =>
    EducationCompany(
      cityCode: (json['cityCode'] as num?)?.toInt(),
      countyCode: (json['countyCode'] as num?)?.toInt(),
      createBy: json['createBy'] as String?,
      createTime: json['createTime'] as String?,
      deleteStatus: (json['deleteStatus'] as num?)?.toInt(),
      directorName: json['directorName'] as String?,
      directorPhone: json['directorPhone'] as String?,
      educationName: json['educationName'] as String?,
      educationType: (json['educationType'] as num?)?.toInt(),
      id: json['id'] as String?,
      logo: json['logo'] as String?,
      provinceCode: (json['provinceCode'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      updateBy: json['updateBy'] as String?,
      updateTime: json['updateTime'] as String?,
    );

Map<String, dynamic> _$EducationCompanyToJson(EducationCompany instance) =>
    <String, dynamic>{
      'cityCode': instance.cityCode,
      'countyCode': instance.countyCode,
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'deleteStatus': instance.deleteStatus,
      'directorName': instance.directorName,
      'directorPhone': instance.directorPhone,
      'educationName': instance.educationName,
      'educationType': instance.educationType,
      'id': instance.id,
      'logo': instance.logo,
      'provinceCode': instance.provinceCode,
      'status': instance.status,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
    };
