import 'package:flutter/material.dart';

///
import 'index_router.dart';

/// page
import 'package:flutter_shop_demo/pages/detail/goods_detail.dart';

/// create by MZP 2019-08-19 10:09
///
///
///
/// @author: mzp
///

/// 商品详情
var goodsDetailsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsId = params["goodsId"].first;

  return GoodsDetail(goodsId);
});