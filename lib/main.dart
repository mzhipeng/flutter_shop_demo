import 'dart:async';
import 'package:flutter/material.dart';
///
import 'package:fluro/fluro.dart';
/// index
import './pages/index_page.dart';
import 'provide/index_provide.dart';
/// common
import 'common/global_config.dart';
import 'common/app.dart';


void main() {


  GlobalConfig.initRouter(Router());

  runZoned(() {
    runApp(
      MultiProvider(
        providers: getProviders(),
        child: new MaterialApp(
          onGenerateRoute: App.router.generator,
          title: '百姓生活+',
          debugShowCheckedModeBanner: false,
          // 显示debug模式
          theme: new ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: new IndexPage(),
//      home: new TestApi(),
        ),
      ),
    );

    PaintingBinding.instance.imageCache.maximumSize = 100;
  });

}
