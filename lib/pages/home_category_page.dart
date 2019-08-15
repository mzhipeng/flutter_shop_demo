import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/model/home_page_category_model.dart';

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
  List<BxMallSubDto> categoryRightDataList = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('分类'),
      ),
      body: Row(
        children: <Widget>[
          _createLeftList(),
          Column(
            children: <Widget>[
              _createRightTitle(),
              _createRightList(),
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

  @override
  void reassemble() {
    queryData();
    super.reassemble();
  }

  void queryData() {
    HttpManager.instance.post(url_home_category).then((it) {
      var data = HomeCategoryModel.fromJsonMap(it);
      setState(() {
        categoryDataList.clear();
        categoryDataList.addAll(data.data);
      });
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
          return InkWell(
            onTap: () {
              setState(() {
                categoryRightDataList.clear();
                categoryRightDataList
                    .addAll(categoryDataList[index].bxMallSubDtoList);
              });
            },
            child: Container(
                height: h(100),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
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

  Widget _createRightTitle() {
    double rightWidth = (screenDpW - w(180)) * 0.5;

    if (categoryRightDataList.length > 0) {
      return ListView(
        children: <Widget>[
          Wrap(
            spacing: 2,
            children: categoryRightDataList.map((it) {
              return Container(
                width: rightWidth,
                height: 200,
                child: InkWell(
                  onTap: () {},
                  child: Text(it.mallSubName),
                ),
              );
            }).toList(),
          ),
        ],
      );
    }

    return Text("空");
  }

  Widget _createRightList() {
    double rightWidth = (screenDpW - w(180)) * 0.5;

    if (categoryRightDataList.length > 0) {
      return ListView(
        children: <Widget>[
          Wrap(
            spacing: 2,
            children: categoryRightDataList.map((it) {
              return Container(
                width: rightWidth,
                height: 200,
                child: InkWell(
                  onTap: () {},
                  child: Text(it.mallSubName),
                ),
              );
            }).toList(),
          ),
        ],
      );
    }

    return Text("空");
  }
}
