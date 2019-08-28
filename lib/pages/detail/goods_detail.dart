import 'package:flutter/material.dart';

/// common
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';

/// model
import 'package:flutter_shop_demo/model/goods_detail.dart';

/// widget
import 'package:flutter_shop_demo/widget/view_state.dart';
import 'package:flutter_shop_demo/widget/layout/goods_detail_page.dart';

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

  GoodsDetail(this.goodsId);

  GoodsDetailProvide provider;
  var queryData4NetByGoodsId;

  @override
  Widget build(BuildContext context) {
    if (provider == null) {
      provider = Provider.of<GoodsDetailProvide>(context);
      queryData4NetByGoodsId = provider.queryData4NetByGoodsId(goodsId);
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: FutureState<Widget>(
          loadingType: ViewState.shimmer,
          future: queryData4NetByGoodsId,
          successBuilder: (context, it) {
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: TopInfoWidget(),
                ),

              ],
            );
          }),
    );
  }
}
