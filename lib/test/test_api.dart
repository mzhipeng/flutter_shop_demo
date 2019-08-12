import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/net/api.dart';

/// create by MZP 2019-08-12 15:12
///
/// 测试网络请求返回
///
/// @author: mzp
///

class TestApi extends StatefulWidget {
  @override
  TestApiState createState() => new TestApiState();
}

class TestApiState extends State<TestApi> {
  var testApi = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试API'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              testApi,
            ),
            RaisedButton(
              onPressed: () {
                _onBtnClick();
              },
              child: Text("测试"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(TestApi oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _onBtnClick() {
    requestData4NetJiKe().then((data) {
      setState(() {
        testApi = data.toString();
      });
    });
  }

  Future requestData4NetJiKe() async {
    try {
      var dio = Dio();
      dio.options.headers = httpHeaders_JiKe;
      var post = await dio.post(
        "https://time.geekbang.org/serv/v1/column/newAll",
        data: {},
      );
      print(post);
      return post.data;
    } catch (e) {
      return print(e);
    }
  }


  Future queryData4Net(String type) async {
    try {
      var response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
          queryParameters: {"name": type});
//      if(response.statusCode == 200){
//        return "";
//      }
      print(response.data["data"].toString());
      return response.data;
//      setState(() {
//        test = response.data.toString();
//      });
    } catch (e) {
      print(e);
    }
  }

  Future queryData4NetPost(String type) async {
    try {
      var response = await Dio().post(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
          queryParameters: {"name": type});
//      if(response.statusCode == 200){
//        return "";
//      }
      print(response.data["data"].toString());
      return response.data;
//      setState(() {
//        test = response.data.toString();
//      });
    } catch (e) {
      print(e);
    }
  }

}
