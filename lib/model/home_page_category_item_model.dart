/// create by MZP 2019-08-15 16:43
///
/// 首页-分类模块
///
/// @author: mzp
///

class HomeCategoryItemModel {
  String code;
  String message;
  List<CategoryGoods> goodsList;

  HomeCategoryItemModel.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        message = map["message"],
        goodsList =
            List<CategoryGoods>.from((map["data"] ?? []).map((it) => CategoryGoods.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    data['data'] =
        data != null ? this.goodsList.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class CategoryGoods {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryGoods.fromJsonMap(Map<String, dynamic> map)
      : image = map["image"],
        oriPrice = map["oriPrice"],
        presentPrice = map["presentPrice"],
        goodsName = map["goodsName"],
        goodsId = map["goodsId"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = image;
    data['oriPrice'] = oriPrice;
    data['presentPrice'] = presentPrice;
    data['goodsName'] = goodsName;
    data['goodsId'] = goodsId;
    return data;
  }
}
