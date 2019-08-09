import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '百姓生活+',
      debugShowCheckedModeBanner: false, // 显示debug模式
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new IndexPage(),
    ),
  );
}
