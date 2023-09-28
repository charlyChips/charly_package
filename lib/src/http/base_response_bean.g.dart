// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseBean _$BaseResponseBeanFromJson(Map<String, dynamic> json) =>
    BaseResponseBean(
      header: json['header'] == null
          ? null
          : BaseResponseHeaders.fromJson(
              json['header'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$BaseResponseBeanToJson(BaseResponseBean instance) =>
    <String, dynamic>{
      'header': instance.header,
      'data': instance.data,
    };

BaseResponseHeaders _$BaseResponseHeadersFromJson(Map<String, dynamic> json) =>
    BaseResponseHeaders(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseResponseHeadersToJson(
        BaseResponseHeaders instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
