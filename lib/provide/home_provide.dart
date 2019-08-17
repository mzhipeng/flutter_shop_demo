import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/model/home_page_category_item_model.dart';
import 'package:flutter_shop_demo/model/home_page_category_model.dart';

/// create by mzo
///
///
/// @auther: mzp
///
class HomePageCarProvide with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  HomePageCarProvide(this._value);

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}

class HomePageCategoryProvide with ChangeNotifier {
  List<BxMallSubDto> _categoryRightTitleList = [];

  int _rightSelectIndex = -1;

  BxMallSubDto _rightSelectTitle;

  int _currentRightPage = 2;

  List<CategoryGoods> _categoryGoodsList = [];

  HomePageCategoryProvide(this._categoryRightTitleList);

  int get rightSelectIndex => _rightSelectIndex;

  int get currentRightPage => _currentRightPage;

  BxMallSubDto get rightSelectTitle => _rightSelectTitle;

  List<BxMallSubDto> get categoryRightTitleList => _categoryRightTitleList;

  List<CategoryGoods> get categoryGoodsList => _categoryGoodsList;

  /// 刷新商品分类右侧布局的标题
  void refreshRightTitleList(List<BxMallSubDto> list) {
    _categoryRightTitleList.clear();
    _categoryRightTitleList.addAll(list);
    notifyListeners();
  }

  /// 刷新商品分类-右侧布局的标题选中状态
  void refreshRightSelectIndex(int index, BxMallSubDto rightSelectTitle) {
    _rightSelectIndex = index;
    _rightSelectTitle = rightSelectTitle;
    _currentRightPage = 2;
    notifyListeners();
  }

  /// 刷新商品分类-详细商品数据
  void refreshRightItemList(List<CategoryGoods> list) {
    _categoryGoodsList.clear();
    _categoryGoodsList.addAll(list);
    notifyListeners();
  }

  /// 刷新商品分类-详细商品数据-加载更多
  void onLoadRightItemList(List<CategoryGoods> list) {
    _currentRightPage++;
    _categoryGoodsList.addAll(list);
    notifyListeners();
  }
}
