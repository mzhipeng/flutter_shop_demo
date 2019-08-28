import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// create by MZP 2019-08-19 20:08
///
/// 商品详情页
///
///
/// 商品详情头部简介
class TopInfoWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Consumer<GoodsDetailProvide>(
        builder: (context, p, child) {
          return Column(
            children: <Widget>[
              Image.network(p.data.goodInfo.image1),
              Text(
                '${p.data.goodInfo.goodsName}',
                style: TextStyle(fontSize: sp(30)),
              ),
              Text(
                '编号',
                style: TextStyle(color: ResColors.text_gray),
              ),
              _createGoodPrice('${p.data.goodInfo.oriPrice}', ''),
            ],
          );
        },
      ),
    );
  }

  /// 商品价格
  Widget _createGoodPrice(String price, String price2) {
    return Row(
      children: <Widget>[
        Text('$price'),
        Text('市场价:'),
        Text('$price2'),
      ],
    );
  }
}

class TopInfo1Widget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}

class TopInfo2Widget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}

class AddCartWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}
