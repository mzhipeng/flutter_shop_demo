import 'package:flutter/material.dart';
///
import 'package:fluro/fluro.dart';
/// router
import 'package:flutter_shop_demo/router/router_path.dart';

/// create by MZP 2019-08-12 20:27
///
/// 主要提供 context 使用的方法
///
///
class App {
  static Router router;

  static BuildContext context;

  static Future navigateTo(BuildContext context, String path,
      {Map<String, String> params}) {
    if (params == null) {
      return App.router.navigateTo(context, RoutersPath.getPath(path), transition: TransitionType.cupertino);
    } else {
      return App.router.navigateTo(
          context, RoutersPath.getPath(path) + getNavigateToParams(params), transition: TransitionType.cupertino);
    }
  }

  static void pop(BuildContext context) {
    App.router.pop(context);
  }

  static String getNavigateToParams(Map<String, String> params) {
    String path = "";
    params
      ..forEach((key, value) {
        path += "?$key=$value";
      });
    return path;
  }

}
