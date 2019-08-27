import 'package:flutter/material.dart';
import 'package:flutter_shop_demo/widget/spinkit/ripple.dart';

/// index
export 'package:flutter_shop_demo/res/index_res.dart';
export 'package:flutter_shop_demo/provide/index_provide.dart';
export 'package:flutter_shop_demo/router/index_router.dart';

/// app common
import '../app.dart';
export 'package:flutter_shop_demo/common/app.dart';
import 'package:flutter_shop_demo/common/utils/dialog_utils.dart';

/// utils
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// widget
import 'package:flutter_shop_demo/widget/spinkit/fading_circle.dart';

import 'base_widget.dart';

/// create by MZP 2019-08-13 16:42
///
///
///
///
///
class Base {
  showHint(BuildContext context, String content) {
    DialogUtils.showHint(context, content);
  }

  showProgress({String msg = "正在加载中..."}) {
    DialogUtils.showProgress(msg);
  }

  dismissProgress() {
    DialogUtils.dismissProgress();
  }

  ///----------------------------------------------------

  /// 页面跳转

  Future navigateTo(BuildContext context, String path,
      {Map<String, String> params}) {
    return App.navigateTo(context, path, params: params);
  }

  void pop(BuildContext context) {
    App.pop(context);
  }

  ///----------------------------------------------------

  ///----------------------------------------------------

  h(double height) => ScreenUtil.instance.setHeight(height);

  w(double width) => ScreenUtil.instance.setWidth(width);

  sp(double fontSize) => ScreenUtil.instance.setSp(fontSize);

  double get screenDpW => ScreenUtil.screenWidthDp;

  double get screenDpH => ScreenUtil.screenHeightDp;

  double get screenHalfDpW => screenDpW * 0.5;

  double get screenHalfDpH => screenDpH * 0.5;

//  double get screenW => ScreenUtil.screenWidth;
//  double get screenH => ScreenUtil.screenHeight;
//  double get screenHalfW => screenW * 0.5;
//  double get screenHalfH => screenH * 0.5;

  /// 安全区域的dp高度
  double get safeContentH =>
      screenDpH - ScreenUtil.statusBarHeight - ScreenUtil.bottomBarHeight;

  /// 实际安全区域的dp高度
  double get safeH =>
      safeContentH - kToolbarHeight - kBottomNavigationBarHeight;

  ///----------------------------------------------------

  Widget get emptyCenterWidget => Center(child: Text("内容空"));

  Widget get emptyLoadingWidget =>
      Center(child: SpinKitRipple(color: ResColors.app_main));

  /// msg：提示的文字，String类型。
  /// toastLength: 提示的样式，主要是长度，有两个值可以选择：Toast.LENGTH_SHORT ：短模式，就是比较短。Toast.LENGTH_LONG : 长模式，就是比较长。
  /// gravity：提示出现的位置，分别是上中下，三个选项。ToastGravity.TOP顶部提示，ToastGravit.CENTER中部提示，ToastGravity.BOTTOM底部提示。
  /// bgcolor: 背景颜色，跟从Flutter颜色。
  /// textcolor：文字的颜色。
  /// fontSize： 文字的大小。
  void show(String msg) => Fluttertoast.showToast(msg: msg);

  printLog(Object o) {
    print("");
    print("=========================================================START");
    print(o);
    print("=========================================================END");
  }
}

///
abstract class BaseStatelessWidget extends StatelessWidget with Base {}

abstract class BaseStatefulWidget extends StatefulWidget with Base {}

abstract class BaseState<T extends StatefulWidget> extends State with Base {}
