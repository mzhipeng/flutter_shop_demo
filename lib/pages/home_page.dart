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

  Future getBannerContent() {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return HttpManager.instance.post(url_home_bannerContext, formData);
  }

  Future getHomeItemContent() {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return HttpManager.instance
        .post(url_home_bannerContext, formData)
        .then((data) {
      setState(() {
        homePageContent = data.toString();
      });
    });
  }
}
