part 'base_response_bean.g.dart';

// CLASE BASE USADA EN CASI TODOS LOS PROYECTOS DE CHARLY
class BaseResponseBean {
  BaseResponseBean({this.header, this.data});

  factory BaseResponseBean.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseBeanFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseBeanToJson(this);

  final BaseResponseHeaders? header;
  final dynamic data;
}

class BaseResponseHeaders {
  BaseResponseHeaders({this.code, this.message});
  factory BaseResponseHeaders.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseHeadersFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseHeadersToJson(this);

  final int? code;
  final String? message;
}
