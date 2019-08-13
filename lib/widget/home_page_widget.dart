import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/utils/url_utils.dart';

///
import 'package:flutter_swiper/flutter_swiper.dart';

///
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// create by MZP 2019-08-13 10:38
///
/// 自定义的首页轮播控件
///
/// @author: mzp
///
class HomePageSwiper extends BaseStatelessWidget {
  final List itemList;

  HomePageSwiper({this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: ScreenUtil.instance.setWidth(750),
      height: h(333),
      child: Swiper(
        itemCount: itemList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${itemList[index]["image"]}",
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}

/// 店长布局
class HomePageShopowner extends BaseStatelessWidget {
  /// 店长图片
  final String imgPath;

  /// 店长电话
  final String phone;

  HomePageShopowner({this.imgPath, this.phone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UrlUtils.tel(phone);
      },
      child: Image.network(imgPath),
    );
  }
}

/// 热门推荐商品布局
class HomePageRecommend extends BaseStatelessWidget {
  final List items;

  HomePageRecommend({this.items});

  /// 推荐商品 标题
  Widget _createTitle() {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              // 设置边界, 底部高度为0.5 //颜色灰色
              bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pinkAccent),
      ),
    );
  }

  /// 推荐商品 列表 item
  Widget _createItem(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: w(250),
        height: h(330),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(color: Colors.black12, width: 0.5))),
        child: Column(
          children: <Widget>[
            Image.network(items[index]["image"]),
            Text("￥${items[index]["mallPrice"]}"),
            Text(
              "￥${items[index]["price"]}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, // 删除线
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  /// 推荐商品 列表 - 横向滚动
  Widget _createScrollRecommend() {
    return Container(
      height: h(330),
      child: ListView.builder(
        padding: new EdgeInsets.all(8),
        scrollDirection: Axis.horizontal, // 设置水平滚动
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _createItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h(380),
      child: Column(
        children: <Widget>[
          _createTitle(),
          _createScrollRecommend(),
        ],
      ),
    );
  }
}
