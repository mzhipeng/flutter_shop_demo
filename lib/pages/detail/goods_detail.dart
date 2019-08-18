import 'package:flutter/material.dart';

/// common
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// create by mzp
///
///
///
class GoodsDetail extends BaseStatelessWidget {
  final String goodsId;

  GoodsDetail(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$goodsId'),
      ),
    );
  }
}
