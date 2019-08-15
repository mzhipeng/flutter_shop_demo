import 'package:flutter/material.dart';
///
export 'package:flutter_shop_demo/res/index_res.dart';
///
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_demo/common/utils/dialog_utils.dart';

/// create by MZP 2019-08-13 16:42
///
///
///
/// @author: mzp
///
///
class Base {
  showHint(BuildContext context, String content) {
    DialogUtils.showHint(context, content);
  }

  showProgress(BuildContext context, String content) {
    DialogUtils.showHint(context, content);
  }

  dismiss(BuildContext context, String content) {
    DialogUtils.showHint(context, content);
  }

  h(double height) => ScreenUtil.instance.setHeight(height);

  w(double width) => ScreenUtil.instance.setWidth(width);

  sp(double fontSize) => ScreenUtil.instance.setSp(fontSize);

  double get screenW => ScreenUtil.screenWidth;

  double get screenDpW => ScreenUtil.screenWidthDp;

  double get screenH => ScreenUtil.screenHeight;

  double get screenDpH => ScreenUtil.screenHeightDp;

  double get screenHalfW => screenW * 0.5;

  double get screenHalfDpW => screenDpW * 0.5;

  double get screenHalfH => screenH * 0.5;

  double get screenHalfDpH => screenDpH * 0.5;

  printLog(Object o){
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
