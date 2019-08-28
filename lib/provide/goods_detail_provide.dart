import 'package:flutter/material.dart';

///
import 'package:flutter_shop_demo/common/net/api.dart';

///
import 'package:flutter_shop_demo/model/goods_detail.dart';

/// create by MZP 2019-08-20 11:02
///
/// 商品详细信息页面
///
/// @author: mzp
///
class GoodsDetailProvide with ChangeNotifier {
  GoodsDataBean _goodsDataBean;

  GoodsDataBean get data => _goodsDataBean;

  /// 根据goodsId 查询商品信息
  Future queryData4NetByGoodsId(String goodsId) {
    return HttpManager.instance
        .post(url_goods_detail, data: {"goodId": goodsId}).then((it) {
      var data = GoodsDetailModel.fromJson(it);
      if (data != null) {
        _goodsDataBean = data.data;
        notifyListeners();
      }
      return data;
    });
  }
}
