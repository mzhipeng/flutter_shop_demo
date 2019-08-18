import 'package:flutter/material.dart';
///
import 'package:fluro/fluro.dart';
/// index
import './pages/index_page.dart';
import 'provide/index_provide.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((context) => HomePageCarProvide(0)))
    ..provide(Provider.function((context) => HomePageCategoryProvide([])));
  var roter = Router();

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
