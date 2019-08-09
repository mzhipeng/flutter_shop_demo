import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// pages
import 'home_cart_page.dart';
import 'home_category_page.dart';
import 'home_my_page.dart';
import 'home_page.dart';

/// create by DDYX 2019-08-08 14:37
///
///
/// @author: mzp
///

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  /// 底部按钮
  final List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")),
  ];

  final List bottomPageItem = [
    HomePage(),
    HomeCategoryPage(),
    HomeCartPage(),
    HomeMyPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = bottomPageItem[currentIndex];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomItem,
        onTap: (index) {
          setState(() {
            currentPage = bottomPageItem[currentIndex = index];
          });
        },
      ),
    );
  }
}
