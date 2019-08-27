import 'package:flutter/material.dart';

/// widget
import 'package:flutter_shop_demo/widget/easy_refresh_diy.dart';
import 'package:flutter_shop_demo/widget/layout/home_page_widget.dart';
import 'package:flutter_shop_demo/widget/gridview_img_with_text.dart';

/// app common
import 'package:flutter_shop_demo/common/net/api.dart';
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// page
import 'detail/goods_detail.dart';

/// create by DDYX 2019-08-08 16:49
///
/// app 首页
///
/// @author: mzp
///
class HomePage extends BaseStatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends BaseState<HomePage> {
//  TextEditingController _teController = TextEditingController();
  EasyRefreshController _refreshConl = EasyRefreshController();
  int currentPage = 1;
  List<Map> goodsList = [];
  var bannerContentFuture;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('百姓生活+'),
      ),
      body: FutureBuilder(
        future: bannerContentFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            var advertesPicture =
                data['data']['advertesPicture']['PICTURE_ADDRESS'];

            var shopownerImgPath = data['data']['shopInfo']['leaderImage'];
            var shopownerPhone = data['data']['shopInfo']['leaderPhone'];

            String itemHeaderPic1 =
                data['data']['floor1Pic']['PICTURE_ADDRESS']; /*楼层1的标题图片*/
            String itemHeaderPic2 =
                data['data']['floor2Pic']['PICTURE_ADDRESS']; /*楼层2的标题图片*/
            String itemHeaderPic3 =
                data['data']['floor3Pic']['PICTURE_ADDRESS']; /*楼层3的标题图片*/

            return EasyRefresh(
              footer: MyFooter(),
              controller: _refreshConl,
              onLoad: () {
                currentPage++;
                return getHomeItemList(currentPage);
              },
              child: ListView(
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
                  _createHomePageHotItem(),
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
    bannerContentFuture = getBannerContent();
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
  Future getHomeItemList(int currentPage) {
    return HttpManager.instance
        .post(url_home_goods, data: {"page": currentPage}).then((it) {
      printLog(it.toString());
      List<Map> dataList = (it['data'] as List).cast();
      setState(() {
        goodsList.addAll(dataList);
      });
    });
  }

  /// 创建首页底部商品数据
  Widget _createHomePageHotItem() {
    return Column(
      children: <Widget>[
        hotItemTitle,
        _createHotItem(),
      ],
    );
  }

  /// 商品底部item标题
  Widget hotItemTitle = Container(
    margin: EdgeInsets.all(8),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text(
      "火爆专区",
      style: TextStyle(color: ResColors.app_main),
    ),
  );

  /// 商品底部item列表
  Widget _createHotItem() {
    if (goodsList.length > 0) {
      List<Widget> widgetList = goodsList.map((it) {
        return InkWell(
          onTap: () {
            GoodsDetail.start(context, it["goodsId"]);
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(4),
            width: screenHalfDpW - 8,
            child: Column(
              children: <Widget>[
                Image.network(it["image"]),
                Text(
                  it["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pinkAccent, fontSize: sp(26)),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("￥${it["mallPrice"]}"),
                    Text(
                      "￥${it["price"]}",
//                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: widgetList,
      );
    }
    return Text("");
  }
}
