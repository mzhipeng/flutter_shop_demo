import 'package:flutter/material.dart';

/// widget
import 'easy_refresh_diy.dart';

/// common
import '../common/base/base_widget.dart';
import '../common/net/api.dart';

/// model
import '../model/home_page_category_model.dart';
import '../model/home_page_category_item_model.dart';

/// create by MZP 2019-08-16 16:01
///
/// 首页-商品分类-布局拆分
///
/// @author: mzp
///

typedef OnCategoryIndexClickedCallback = void Function();

/// 商品分类-右侧标题
class CategoryRightTitle extends BaseStatelessWidget {
  final HomePageCategoryProvide _homePageCategoryProvide;
  final OnCategoryIndexClickedCallback _clickedListener;

  CategoryRightTitle(this._homePageCategoryProvide, this._clickedListener);

  Widget _createRightTitle() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: ResColors.gray))),
      width: screenDpW - w(180),
      height: h(80),
      child: Row(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: InkWell(
            onTap: () {
              var selectTitle =
                  _homePageCategoryProvide.categoryRightTitleList[0];

              _homePageCategoryProvide.refreshRightSelectIndex(-1, selectTitle);
              queryData(true, selectTitle);
              _clickedListener();
            },
            child: Provide<HomePageCategoryProvide>(
              builder: (context, child, p) {
                bool isAll = p.rightSelectIndex == -1;
                return Text(
                  "全部",
                  style: TextStyle(
                    color: isAll ? ResColors.app_main : ResColors.text_dark,
//                    fontWeight: isAll ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          width: screenDpW - w(280),
          child: Provide<HomePageCategoryProvide>(
            builder: (context, child, p) {
              return ListView.builder(
                scrollDirection: Axis.horizontal, // 设置水平滚动
                itemCount: p.categoryRightTitleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _createItem(index, p.rightSelectIndex == index,
                      p.categoryRightTitleList[index]);
                },
              );
            },
          ),
        ),
      ]),
    );
  }

  Widget _createItem(int index, bool isSelect, BxMallSubDto it) {
    return InkWell(
      onTap: () {
        _homePageCategoryProvide.refreshRightSelectIndex(index, it);
        queryData(false, it);
        _clickedListener();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Text(it.mallSubName,
            style: TextStyle(
              color: isSelect ? ResColors.app_main : ResColors.text_dark,
//              fontWeight: isSelect ? FontWeight.bold : FontWeight.normal,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _createRightTitle();
  }

  void queryData(bool isAll, BxMallSubDto it) {
    if (isAll) {
      _homePageCategoryProvide.refreshRightSelectIndex(-1, it);
      _clickedListener();
    }

    var data = {
      'categoryId': it.mallCategoryId,
      'categorySubId': isAll ? "" : it.mallSubId,
      'page': 1
    };

    HttpManager.instance.post(url_home_category_goods, data: data).then((it) {
      var data = HomeCategoryItemModel.fromJsonMap(it);
      _homePageCategoryProvide.refreshRightItemList(data.goodsList);
    });
  }
}

/// 商品分类-右侧内容
class CategoryRightContent extends BaseStatelessWidget {
//  final EasyRefreshController _refreshConl = new EasyRefreshController();
  final HomePageCategoryProvide _homePageCategoryProvide;
  final ScrollController scrollController = ScrollController();

  CategoryRightContent(this._homePageCategoryProvide);

  /// 右侧商品列表
  Widget _createRightList() {
    double _rightImgWidth = (screenDpW - w(180)) / 3;
    return Expanded(
      child: Container(
        width: screenDpW - w(180),
        child: Provide<HomePageCategoryProvide>(builder: (context, child, p) {
          bool isEmpty = p.categoryGoodsList.length == 0;
//          jumpToTop();
          return isEmpty
              ? emptyCenterWidget
              : EasyRefresh(
                  footer: MyFooter(),
//            controller: _refreshConl,
                  onLoad: () {
                    return getItemListByProvide();
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: p.categoryGoodsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _createItem(
                          _rightImgWidth, p.categoryGoodsList[index]);
                    },
                  ),
                );
        }),
      ),
    );
  }

  /// 列表item
  Widget _createItem(double imgWidth, CategoryGoods it) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: ResColors.gray,
        width: 2,
      ))),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: imgWidth,
            height: h(200),
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            child: Image.network(it.image),
          ),
          Container(
            color: Colors.white,
            width: imgWidth * 2,
            height: h(200),
            padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
            child: _createItemRight(it),
          )
        ],
      ),
    );
  }

  /// item 右侧布局
  Stack _createItemRight(CategoryGoods it) {
    return Stack(
      children: <Widget>[
        Text(
          it.goodsName,
          style: TextStyle(fontSize: ResSize.text_content),
        ),
        Positioned(
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "￥${it.presentPrice}",
                style: TextStyle(
                    color: ResColors.app_main, fontSize: ResSize.text_content),
              ),
              Text(
                "￥${it.oriPrice}",
                style: TextStyle(
                  fontSize: ResSize.text_content_hint,
                  color: ResColors.text_gray,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _createRightList();
  }

  void jumpToTop() {
    try {
      if (scrollController.hasClients && scrollController.offset > 0) {
        scrollController.jumpTo(0);
      }
    } catch (e) {
      printLog(e);
    }
  }

  /// 获取商品列表
  Future getItemListByProvide() {
    var data = {
      'categoryId': _homePageCategoryProvide.rightSelectTitle.mallCategoryId,
      'categorySubId': _homePageCategoryProvide.rightSelectTitle.mallSubId,
      'page': _homePageCategoryProvide.currentRightPage
    };
    return HttpManager.instance
        .post(url_home_category_goods, data: data)
        .then((it) {
      var data = HomeCategoryItemModel.fromJsonMap(it);
      if (data.goodsList.isEmpty) {
        show("没有更多数据了");
      } else {
        _homePageCategoryProvide.onLoadRightItemList(data.goodsList);
      }
    });
  }
}
