import 'package:flutter/material.dart';

///
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/common/utils/url_utils.dart';

///
import 'package:flutter_swiper/flutter_swiper.dart';

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
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              // 设置边界, 底部高度为0.5 //颜色灰色
              bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Cols.app_main),
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
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(color: Colors.black12, width: 1))),
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
      height: h(340),
      child: ListView.builder(
        padding: new EdgeInsets.all(4),
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
      height: h(390),
      child: Column(
        children: <Widget>[
          _createTitle(),
          _createScrollRecommend(),
        ],
      ),
    );
  }
}

/// 首页推荐商品列表-头部
class HomePageItemHeader extends BaseStatelessWidget {
  final String pictureUrl;

  HomePageItemHeader({this.pictureUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Image.network(pictureUrl),
    );
  }
}

/// 首页推荐商品列表-item
class HomePageItem extends BaseStatelessWidget {
  final List goodsList;

  HomePageItem({this.goodsList});

  /// 左边标题
  Widget _createDefaultItems() {
    return Row(
      children: <Widget>[
        _createItem(goodsList[3]),
        _createItem(goodsList[4]),
      ],
    );
  }

  /// 列表头部
  Widget _createHeaderItem() {
    return Row(
      children: <Widget>[
        _createItem(goodsList[0]),
        Column(
          children: <Widget>[
            _createItem(goodsList[1]),
            _createItem(goodsList[2]),
          ],
        ),
      ],
    );
  }

  /// 商品信息
  Widget _createItem(Map goods) {
    return Container(
      width: screenHalfDpW,
      child: InkWell(
        onTap: () {},
        child: Image.network(goods["image"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
//        height: h(750),
        child: Column(
          children: <Widget>[
            _createHeaderItem(),
            _createDefaultItems(),
          ],
        ),
      ),
    );
  }
}

typedef OnCall = Function();

/// 首页底部商品
class HomePageHotItem extends BaseStatefulWidget {

  final OnCall onCall;

  int currentPage = 1;

  HomePageHotItem({this.currentPage, this.onCall});

  HomePageHotItemState homePageHotItemState;

  @override
  HomePageHotItemState createState() {
    homePageHotItemState = new HomePageHotItemState();
    return homePageHotItemState;
  }

  void onLoad() {
    if (homePageHotItemState != null) {
      currentPage++;
      homePageHotItemState.getHomeItemList(currentPage);
    }
  }
}

class HomePageHotItemState extends BaseState<HomePageHotItem> {
  int currentPage = 1;
  List<Map> goodsList = [];

  Widget hotItemTitle = Container(
    margin: EdgeInsets.all(8),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text(
      "火爆专区",
      style: TextStyle(color: Cols.app_main),
    ),
  );

  Widget _createHotItem() {
    if (goodsList.length > 0) {
      List<Widget> widgetList = goodsList.map((it) {
        return InkWell(
          onTap: () {},
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(4),
            width: screenHalfDpW - 8,
            child: Column(
              children: <Widget>[
                Image.network(it["image"]),
                Text(
                  it["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pinkAccent, fontSize: sp(26)),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("￥${it["mallPrice"]}"),
                    Text(
                      "￥${it["price"]}",
//                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: widgetList,
      );
    }
    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hotItemTitle,
        _createHotItem(),
      ],
    );
  }

  /// 获取首页商品列表
  void getHomeItemList(int currentPage) {
    HttpManager.instance
        .post(url_home_goods, data: {"page": currentPage}).then((it) {
      List<Map> dataList = (it['data'] as List).cast();
      setState(() {
        goodsList.addAll(dataList);
      });
    });
  }
}
