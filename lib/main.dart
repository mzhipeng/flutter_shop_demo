import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/provide/home_provide.dart';
import 'package:flutter_shop_demo/test/test_api.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((context) => HomePageCarProvide(0)));

  runApp(
    ProviderNode(
      providers: providers,
      child: new MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false, // 显示debug模式
        theme: new ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: new IndexPage(),
//      home: new TestApi(),
      ),
    ),
  );
}
