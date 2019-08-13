import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// create by MZP 2019-08-13 17:09
///
/// 自定义 GridView 图片+文字
///
/// @author: mzp
///
class GridViewImgWithText extends BaseStatelessWidget {
  final List items;

  GridViewImgWithText({this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: h(320),
      child: new GridView.count(
        // 创建几列
        crossAxisCount: 5,
        // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
        scrollDirection: Axis.vertical,
        // 列之间的间距
        crossAxisSpacing: 5,
        // 行之间的间距
        mainAxisSpacing: 5,
        // 默认false 是否根据子孩子的宽高自动包裹item自身
        shrinkWrap: false,
        // true表示数据倒序排列 false表示顺序排列
        reverse: false,
        // 子孩子的比例
        childAspectRatio: 1,
        // 设置子孩子item,这里传入子孩子控件
        children: items.sublist(0, 10).map((item) {
          return _createGridViewItem(context, item);
        }).toList(),
      ),
    );
  }

  Widget _createGridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("click me");
      },
      child: new Column(
        children: [
          Image.network(
            item["image"],
            width: w(95),
          ),
          Text(item["mallCategoryName"]),
        ],
      ),
    );
  }
}
