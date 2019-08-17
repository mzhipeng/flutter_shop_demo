export 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// create by MZP 2019-08-17 16:11
///
///
///
/// @author: mzp
///
class MyFooter extends ClassicalFooter {

  MyFooter()
      : super(
          loadText: "上拉加载",
          loadReadyText: "释放加载",
          loadingText: "正在加载…",
          loadedText: "加载完成",
          loadFailedText: "加载失败",
          noMoreText: "没有更多了",
          infoText: "更新时间为%T",
        );
}
