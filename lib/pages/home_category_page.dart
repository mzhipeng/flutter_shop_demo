import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/model/home_page_category_model.dart';
import 'package:flutter_shop_demo/widget/home_page_category.dart';

/// create by DDYX 2019-08-08 16:49
///
/// 首页-分类页面
///
/// @author: mzp
///
class HomeCategoryPage extends BaseStatefulWidget {
  @override
  HomeCategoryPageState createState() => new HomeCategoryPageState();
}

class HomeCategoryPageState extends BaseState<HomeCategoryPage> {
  List<CategoryDataList> categoryDataList = [];
  HomePageCategoryProvide _categoryProvide;
  int _checkedIndex = 0;

  @override
  Widget build(BuildContext context) {
    _categoryProvide = Provide.value<HomePageCategoryProvide>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('分类'),
      ),
      body: Row(
        children: <Widget>[
          _createLeftList(),
          Column(
            children: <Widget>[
              CategoryRightTitle(_categoryProvide),
              CategoryRightContent()
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    queryData();
    super.initState();
  }

//
//  @override
//  void reassemble() {
//    queryData();
//    super.reassemble();
//  }

  void queryData() {
    HttpManager.instance.post(url_home_category).then((it) {
      var data = HomeCategoryModel.fromJsonMap(it);
      setState(() {
        categoryDataList.clear();
        categoryDataList.addAll(data.data);
      });
      if (_categoryProvide != null) {
        _categoryProvide
            .refreshRightTitleList(categoryDataList[0].bxMallSubDtoList);
      }
    });
  }

  Widget _createLeftList() {
    return Container(
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Cols.gray, width: 1))),
      width: w(180),
      child: ListView.builder(
        itemCount: categoryDataList.length,
        itemBuilder: (BuildContext context, int index) {
          bool isCheckedIndex = _checkedIndex == index;
          return InkWell(
            onTap: () {
              _categoryProvide.refreshRightTitleList(
                  categoryDataList[index].bxMallSubDtoList);
              setState(() {
                _checkedIndex = index;
              });
            },
            child: Container(
                height: h(100),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: isCheckedIndex ? Cols.gray : Colors.white,
                    border:
                        Border(bottom: BorderSide(width: 1, color: Cols.gray))),
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  categoryDataList[index].mallCategoryName,
                  style: TextStyle(fontSize: sp(28)),
                )),
          );
        },
      ),
    );
  }
}
