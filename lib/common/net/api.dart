import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

/// create by DDYX 2019-08-09 10:34
///
/// 请求地址
///
/// @author: mzp
///

/// 极客学院请求头
const httpHeaders_JiKe = {
  'Accept': 'application/json, text/plain, */*',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept-Language': 'zh-CN,zh;q=0.9',
  'Connection': 'keep-alive',
  'Content-Type': 'application/json',
  'Cookie':
      '_ga=GA1.2.676402787.1548321037; GCID=9d149c5-11cb3b3-80ad198-04b551d; _gid=GA1.2.359074521.1550799897; _gat=1; Hm_lvt_022f847c4e3acd44d4a2481d9187f1e6=1550106367,1550115714,1550123110,1550799897; SERVERID=1fa1f330efedec1559b3abbcb6e30f50|1550799909|1550799898; Hm_lpvt_022f847c4e3acd44d4a2481d9187f1e6=1550799907',
  'Host': 'time.geekbang.org',
  'Origin': 'https://time.geekbang.org',
  'Referer': 'https://time.geekbang.org/',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36'
};

const url_home_bannerContext = 'wxmini/homePageContent'; // 商家首页信息
const url_home_goods = 'wxmini/homePageBelowConten'; //商城首页热卖商品
const url_home_category = 'wxmini/getCategory'; //首页-商品类别信息
const url_home_category_goods = 'wxmini/getMallGoods'; //首页-商品类别-商品列表
const url_goods_detail = 'wxmini/getGoodDetailById'; //商品详细信息列表

class HttpManager {
  Dio _dio = new Dio();
  static HttpManager instance = new HttpManager();

  void init(HttpOptionsModel options) {
    _dio.options.baseUrl = options.baseUrl;
    _dio.options.connectTimeout = options.connectTimeout;
    _dio.options.receiveTimeout = options.receiveTimeout;
    _dio.options.headers = options.headers;
    _dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
  }

  Future get() async {
//    _dio.options.contentType
  }

  Future post(String path, {data}) async {
    try {
      var response = await _dio.post(path, data: data);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.data.toString());
        print("response =============>: start");
        print(jsonData);
        print("response =============>: end");
        return jsonData;
      } else {
        print("ERROR=============>:访问异常");
      }
    } catch (e) {
      print("ERROR=============>$e");
    }
  }
}

class HttpOptionsModel {
  var baseUrl = "";
  var connectTimeout = 5000;
  var receiveTimeout = 5000;
  Map<String, dynamic> headers;

  HttpOptionsModel(this.baseUrl,
      {this.connectTimeout = 5000, this.receiveTimeout = 5000, this.headers});
}
