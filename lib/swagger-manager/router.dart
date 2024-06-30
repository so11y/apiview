import 'dart:convert';
import './parameter.dart';

class Router {
  String path; //路由地址
  String method; //请求方式
  late String summary; //接口描述
  late bool deprecated; //是否废弃
  late List<Parameter> parameters = []; //参数列表
  Router(
      {required this.path,
      required this.method,
      required Map<String, dynamic> rawRouter}) {
    this.summary = rawRouter["summary"] ?? "";
    this.deprecated = rawRouter["deprecated"] ?? false;
    if (rawRouter["parameters"] != null) {
      List<dynamic> rawParameters = rawRouter["parameters"];
      this.parameters = rawParameters.map((e) => Parameter(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method,
      'summary': summary,
      'deprecated': deprecated,
      'parameters': parameters.map((e) => e.toJson()).toList()
    };
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this.toJson());
  }
}
