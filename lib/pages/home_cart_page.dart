import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/provide/home_provide.dart';
import 'package:provider/provider.dart';

/// create by DDYX 2019-08-08 16:49
///
/// 首页-购物车
///
/// @author: mzp
///
class HomeCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物车'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(),
            MyBtn(),
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<HomePageCarProvide>(builder: (context, provide, child) {
        return Text("${provide.value}");
      }),
    );
  }
}

class MyBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<HomePageCarProvide>(context);
    return Container(
      child: RaisedButton(
        onPressed: () {
          p.increment();
        },
        child: Text("+ 1"),
      ),
    );
  }
}
