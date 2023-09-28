import 'package:freezed_annotation/freezed_annotation.dart';
part '{{modelName.snakeCase()}}.g.dart';

@JsonSerializable()
class {{modelName.pascalCase()}} {

  {{modelName.pascalCase()}}({
    required this.id,
  });

  final int? id;

  factory {{modelName.pascalCase()}}.fromJson(Map<String,dynamic> json)=> _${{modelName.pascalCase()}}FromJson(json);
  Map<String,dynamic> toJson() => _${{modelName.pascalCase()}}ToJson(this);
}