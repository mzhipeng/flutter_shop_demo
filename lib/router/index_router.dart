export 'package:fluro/fluro.dart';

///
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// page
import 'package:flutter_shop_demo/pages/my/error_page.dart';

/// router
import 'package:flutter_shop_demo/router/router_path.dart';

/// create by MZP 2019-08-19 10:07
///
/// 配置路由
///
/// @author: mzp
///

class Routers {
  static String root = "/";
//  static String pagesDetail = "/detail";
//  static String pagesError = "/error";

  static void initRouters(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return ErrorPage();
    });
    //
    RoutersPath.initDefine(router);
  }

}
