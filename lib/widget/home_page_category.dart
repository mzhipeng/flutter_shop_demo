import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/model/home_page_category_item_model.dart';

/// model
import 'package:flutter_shop_demo/model/home_page_category_model.dart';

/// create by MZP 2019-08-16 16:01
///
/// 首页-商品分类-布局拆分
///
/// @author: mzp
///

/// 商品分类-右侧标题
class CategoryRightTitle extends BaseStatelessWidget {
  final HomePageCategoryProvide _homePageCategoryProvide;

  CategoryRightTitle(this._homePageCategoryProvide);

  Widget _createRightTitle() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Cols.gray))),
      width: screenDpW - w(180),
      height: h(80),
      child: Row(children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text("全部",
              style: TextStyle(
                color: Cols.app_main,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          width: screenDpW - w(280),
          child: Provide<HomePageCategoryProvide>(
            builder: (context, child, p) {
              return ListView.builder(
                scrollDirection: Axis.horizontal, // 设置水平滚动
                itemCount: p.categoryRightTitleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _createItem(p.categoryRightTitleList[index]);
                },
              );
            },
          ),
        ),
      ]),
    );
  }

  Widget _createItem(BxMallSubDto it) {
    return InkWell(
      onTap: () {
        queryData(it);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Text(it.mallSubName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _createRightTitle();
  }

  void queryData(BxMallSubDto it) {
    var data = {
      'categoryId': it.mallCategoryId,
      'categorySubId': it.mallSubId,
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
  Widget _createRightList() {
    double rightWidth = (screenDpW - w(180)) * 0.5;
//    double rightWidth = w(200);
    return Container(
      width: screenDpW - w(180),
      height: h(1000),
      child: Provide<HomePageCategoryProvide>(builder: (context, child, p) {
        bool isEmpty = p.categoryGoodsList.length == 0;
        return isEmpty ? Text("") : ListView.builder(
          itemCount: p.categoryGoodsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(p.categoryGoodsList[index].goodsName);
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _createRightList();
  }
}
