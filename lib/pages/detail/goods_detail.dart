import 'package:flutter/material.dart';

/// common
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
/// model
import 'package:flutter_shop_demo/model/goods_detail.dart';

/// create by mzp 2019年08月20日10:58:09
///
///
///

class GoodsDetail extends BaseStatelessWidget {
  /// 跳转本页面
  static Future start(BuildContext context, String goodsId) {
    return App.navigateTo(context, "$GoodsDetail",
        params: {"goodsId": goodsId});
  }

  final String goodsId;

//  GoodsDetailProvide _provide;

  GoodsDetail(this.goodsId);

  @override
  Widget build(BuildContext context) {
//    showProgress();
//    var _provide = Provider.of<GoodsDetailProvide>(context);
//    _provide.queryData4NetByGoodsId(goodsId);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品详情"),
      ),
      body: FutureBuilder(
          future: queryData4NetByGoodsId(goodsId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//              dismissProgress();
              var data = snapshot.data as GoodsDetailModel;
              printLog(data.toString());
              return Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showProgress();
                    },
                    child: Text("点击"),
                  ),
                  Text(data.data.goodInfo.goodsName),
                  emptyLoadingWidget
                ],
              );
            } else {
              return emptyLoadingWidget;
            }
          }),
    );
  }

  Future queryData4NetByGoodsId(String goodsId) {
    return HttpManager.instance
        .post(url_goods_detail, data: {"goodId": goodsId}).then((it) {
      var data = GoodsDetailModel.fromJsonMap(it);
//      if (data != null) {
//        notifyListeners();
//      }
      return data;
    });
  }
}
