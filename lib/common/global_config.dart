import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/common/utils/time_utils.dart';
///
import 'package:flutter_shop_demo/provide/index_provide.dart';

/// create by MZP 2019-08-09 10:56
///
/// 全局配置文件
///
/// @author: mzp
///

class GlobalConfig {
  static void init(BuildContext context) {
    initBaseUrl();
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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

}
