import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

/// create by DDYX 2019-08-08 16:49
///
/// app 首页
///
/// @author: mzp
///
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
    );
  }

  void queryData4Net() async {
    try {
      var response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian");
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }
}
