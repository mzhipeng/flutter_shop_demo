import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

/// create by DDYX 2019-08-08 16:49
///
/// app 首页
///
/// @author: mzp
///
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String test = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('百姓生活+'),
      ),
      body: Center(child: Text(test)),
    );
  }

  @override
  void initState() {
    super.initState();
    queryData4Net();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void queryData4Net() async {
    try {
      var response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
          queryParameters: {"name": "大大的高高的白白的"});

      setState(() {
        test = response.data.toString();
      });
    } catch (e) {
      print(e);
    }
  }
}
