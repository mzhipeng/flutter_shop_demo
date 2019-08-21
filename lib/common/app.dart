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


  ///跳转页面 动画左右 可接受返回参数 不关闭当前页面
  startActivity(BuildContext context, Widget routePage) {
    return Navigator.push(
        context,
        // 启用动画路由，在回退时也有效
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (context, animation, secondaryAnimation) {
            return new SlideTransition(
              // 移动动画
                textDirection: TextDirection.ltr,
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: routePage);
          },
        ));
  }

  ///跳转页面 动画左右 可接受返回参数 不关闭当前页面
  startActivityNome(BuildContext context, Widget routePage) {
    return Navigator.push(
        context,
        // 启用动画路由，在回退时也有效
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (context, animation, secondaryAnimation) {
            return new SlideTransition(
              // 移动动画
                textDirection: TextDirection.ltr,
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: routePage);
          },
        ));
  }
}
