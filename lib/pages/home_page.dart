import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/widget/gridview_img_with_text.dart';

///
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/widget/home_page_widget.dart';

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
  int currentPage = 1;
  List<Map> goodsList = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: getBannerContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            var advertesPicture =
                data['data']['advertesPicture']['PICTURE_ADDRESS'];

            var shopownerImgPath = data['data']['shopInfo']['leaderImage'];
            var shopownerPhone = data['data']['shopInfo']['leaderPhone'];

            String itemHeaderPic1 =
                data['data']['floor1Pic']['PICTURE_ADDRESS']; /*楼层1的标题图片*/
            String itemHeaderPic2 =
                data['data']['floor2Pic']['PICTURE_ADDRESS']; /*楼层1的标题图片*/
            String itemHeaderPic3 =
                data['data']['floor3Pic']['PICTURE_ADDRESS']; /*楼层1的标题图片*/

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HomePageSwiper(
                    itemList: data["data"]["slides"] as List,
                  ),
                  GridViewImgWithText(
                    items: data["data"]["category"] as List,
                  ),
                  Image.network(advertesPicture),
                  HomePageShopowner(
                    imgPath: shopownerImgPath,
                    phone: shopownerPhone,
                  ),
                  HomePageRecommend(
                    items: data["data"]["recommend"] as List,
                  ),
                  HomePageItemHeader(
                    pictureUrl: itemHeaderPic1,
                  ),
                  HomePageItem(
                    goodsList: data['data']['floor1'] as List,
                  ),
                  HomePageItemHeader(
                    pictureUrl: itemHeaderPic2,
                  ),
                  HomePageItem(
                    goodsList: data['data']['floor2'] as List,
                  ),
                  HomePageItemHeader(
                    pictureUrl: itemHeaderPic3,
                  ),
                  HomePageItem(
                    goodsList: data['data']['floor3'] as List,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("数据空"),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
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

  /// 获取首页宣传内容
  Future getBannerContent() {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return HttpManager.instance.post(url_home_bannerContext, data: formData);
  }

  /// 获取首页商品列表
  Future getHomeItemList() {
    return HttpManager.instance
        .post(url_home_goods, data: {"page": currentPage}).then((it) {
      var data = json.decode(it.data.toString());
      setState(() {
        goodsList.addAll(data["data"] as List<Map>);
        currentPage++;
      });
    });
  }
}
