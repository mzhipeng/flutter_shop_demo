import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/provide/home_provide.dart';
import 'package:provide/provide.dart';

/// create by DDYX 2019-08-08 16:51
///
/// 首页-会员中心
///
/// @author: mzp
///
class HomeMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homePageCarProvide = Provide.value<HomePageCarProvide>(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('会员中心'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Provide<HomePageCarProvide>(
              builder: (context, child, p) {
                return Text("${p.value}");
              },
            ),
            RaisedButton(
              onPressed: () {
                homePageCarProvide.decrement();
              },
              child: Text("- 1"),
            ),
          ],
        ),
      ),
    );
  }
}
