import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// create by MZP 2019-08-13 20:29
///
/// 兼容iOS 和 Android 的 打开URL
///
/// @author: mzp
///
class UrlUtils {

  static void tel(String phone) async {
    print("tel:" + phone);
    if (await canLaunch(phone)) {

      await launch("tel:" + phone);
    } else {
      print("error");
    }
  }

}
