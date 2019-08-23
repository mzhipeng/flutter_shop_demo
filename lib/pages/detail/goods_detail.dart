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
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: FutureBuilder(
          future: queryData4NetByGoodsId(goodsId),
          builder: (context, it) {

            if (it.hasData) {
//              dismissProgress();
              var data = it.data as GoodsDetailModel;
              return Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showProgress();
                    },
                    child: Text("点击"),
                  ),
                  Text(data.data.goodInfo.goodsName),
                ],
              );
            } else {
              return emptyLoadingWidget;
            }
          }),
    );
  }

  Future queryData4NetByGoodsId(String goodsId) {
    printLog("queryData4NetByGoodsId---$goodsId");
    return HttpManager.instance
        .post(url_goods_detail, data: {"goodId": goodsId}).then((it) async {
      var data = GoodsDetailModel.fromJson(it);
//      if (data != null) {
//        notifyListeners();
//      }
      printLog("delayed");
      await Future.delayed(Duration(seconds: 5));
      printLog("delayed return");
      return data;
    });
  }
}
