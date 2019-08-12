import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'api.dart';
/// create by MZP 2019-08-12 20:09
///
///
///
/// @author: mzp
///

/// 获取主页内容
Future getHomePageContent() async {
  log("getHomePageContent");
  HttpManager.instance.get();



}


void log(Object object){
 print("-----------------" + object + "-----------------");
}