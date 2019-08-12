import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/net/api.dart';

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
  String homePageContent = "来了来了~";
  TextEditingController _teController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('百姓生活+'),
      ),
      body: SingleChildScrollView(
        // 防止键盘弹出把底部控件遮挡
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
              homePageContent,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
            TextField(
              controller: _teController, // 文本输入控制器
              decoration: InputDecoration(
                // 输入框样式
                contentPadding: EdgeInsets.all(10.0), //边距
                labelText: "妹子类型",
                helperText: "请输入需要的类型",
              ),
              autofocus: false, // 自动获取焦点
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("完成"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getContent();
    super.initState();

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

  void getContent() {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    HttpManager.instance
        .post(servicePath['homePageContext'], formData)
        .then((data) {
      setState(() {
        homePageContent = data.toString();
      });
    });
  }
}
