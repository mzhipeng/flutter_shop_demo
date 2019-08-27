/// page
import 'package:flutter_shop_demo/pages/detail/goods_detail.dart';

/// handler
import 'package:flutter_shop_demo/router/router_handler.dart';

///
import 'index_router.dart';

/// create by MZP 2019-08-19 16:08
///
///
///
/// @author: mzp
///
class RoutersPath {
  static void initDefine(Router router) {
    router.define(getPath("$GoodsDetail"), handler: goodsDetailsHandler);
  }

  static String getPath(String path) => "${Routers.root}$path";
}
