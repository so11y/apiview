import 'dart:convert';

class Parameter {
  late String name; //参数名
  late String inType; //参数位置
  late String description; //参数描述
  late bool required; //是否必填
  late String example; //示例
  late Map<String, dynamic> schema; //参数类型
  Parameter(Map<String, dynamic> rawParameter) {
    this.name = rawParameter["name"];
    this.inType = rawParameter["in"];
    this.description = rawParameter["description"] ?? "";
    this.required = rawParameter["required"] ?? false;
    this.example = rawParameter["example"] ?? "";
    this.schema = rawParameter["schema"] ?? {};
  }

  toJson() {
    return {
      'name': name,
      'inType': inType,
      'description': description,
      'required': required,
      'example': example,
      'schema': schema,
    };
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this.toJson());
  }
}
