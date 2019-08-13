import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/common/utils/url_utils.dart';

///
import 'package:flutter_swiper/flutter_swiper.dart';

///
import 'package:flutter_shop_demo/common/base/base_widget.dart';

/// create by MZP 2019-08-13 10:38
///
/// 自定义的首页轮播控件
///
/// @author: mzp
///
class HomePageSwiper extends BaseStatelessWidget {
  final List itemList;

  HomePageSwiper({this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: ScreenUtil.instance.setWidth(750),
      height: h(333),
      child: Swiper(
        itemCount: itemList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${itemList[index]["image"]}",
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}

/// 店长布局
class HomePageShopowner extends BaseStatelessWidget {
  /// 店长图片
  final String imgPath;

  /// 店长电话
  final String phone;

  HomePageShopowner({this.imgPath, this.phone});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UrlUtils.tel(phone);
      },
      child: Image.network(imgPath),
    );
  }
}
