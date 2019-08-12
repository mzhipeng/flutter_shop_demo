import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/common/utils/time_utils.dart';

/// create by MZP 2019-08-09 10:56
///
/// 全局配置文件
///
/// @author: mzp
///

class GlobalConfig {
  void init() {
    initBaseUrl();
  }

  void initBaseUrl() {
//    const serviceUrl= 'http://v.jspang.com:8088/baixing/';
//const serviceUrl= 'http://test.baixingliangfan.cn/baixing/';
    HttpManager.instance.init(new HttpOptionsModel(
        "http://v.jspang.com:8088/baixing/",
        connectTimeout: TimeUtils.minutes,
        receiveTimeout: TimeUtils.minutes,
        headers: {"": ""}));
  }
}
