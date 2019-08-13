import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_demo/common/utils/dialog_utils.dart';

/// create by MZP 2019-08-13 16:42
///
///
///
/// @author: mzp
///
abstract class BaseStatelessWidget extends StatelessWidget {
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
}

abstract class BaseStatefulWidget extends StatefulWidget {
  showHint(BuildContext context, String content) {
    DialogUtils.showHint(context, content);
  }

  h(double height) => ScreenUtil.instance.setHeight(height);

  w(double width) => ScreenUtil.instance.setWidth(width);
}
