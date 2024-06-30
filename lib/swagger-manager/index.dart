import './router.dart';

class SwaggerParse {
  Map<String, dynamic> rawJson;
  List<Router> routers = [];
  SwaggerParse(this.rawJson) {
    Map<String, dynamic> paths = rawJson["paths"];
    paths.forEach((key, value) {
      Map<String, dynamic> path = value;
      path.forEach((method, router) {
        routers.add(Router(path: key, method: method, rawRouter: router));
      });
    });
  }
}
