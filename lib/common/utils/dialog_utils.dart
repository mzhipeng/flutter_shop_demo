import 'package:flutter/material.dart';

/// create by MZP 2019-08-12 20:24
///
/// 对话框工具类
///
/// @author: mzp
///
class DialogUtils {

  /// 显示简单的提示类型对话框
  static void showHint(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text(content),
          );
        });
  }
}
