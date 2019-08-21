import 'package:flutter/widgets.dart';
/// common
import 'app.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/common/utils/time_utils.dart';
/// index
import 'package:flutter_shop_demo/router/index_router.dart';
///
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// create by MZP 2019-08-09 10:56
///
/// 全局配置文件
///
/// @author: mzp
///

class GlobalConfig {

  static void init(BuildContext context, {Router router}) {
    initBaseUrl();
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    App.context = context;
  }

  static void initBaseUrl() {
//    const serviceUrl= 'http://v.jspang.com:8088/baixing/';
//const serviceUrl= 'http://test.baixingliangfan.cn/baixing/';
    HttpManager.instance.init(new HttpOptionsModel(
        "http://v.jspang.com:8088/baixing/",
        connectTimeout: TimeUtils.minutes,
        receiveTimeout: TimeUtils.minutes,
        headers: {"": ""}));
  }

  static void initRouter(Router router) {
    Routers.initRouters(router);
    App.router = router;
  }
}
