
/// create by MZP 2019-08-15 16:43
/// 
/// 首页-分类模块-详细分类商品列表
///
/// @author: mzp
/// 

class HomeCategoryModel {

  String code;
  String message;
  List<CategoryDataList> data;

  HomeCategoryModel.fromJsonMap(Map<String, dynamic> map):
        code = map["code"],
        message = map["message"],
        data = List<CategoryDataList>.from(map["data"].map((it) => CategoryDataList.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    data['data'] = data != null ?
    this.data.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}

class CategoryDataList {

  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDtoList;
  String comments;
  String image;

  CategoryDataList.fromJsonMap(Map<String, dynamic> map):
        mallCategoryId = map["mallCategoryId"],
        mallCategoryName = map["mallCategoryName"],
        bxMallSubDtoList = List<BxMallSubDto>.from(map["bxMallSubDto"].map((it) => BxMallSubDto.fromJsonMap(it))),
        comments = map["comments"],
        image = map["image"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = mallCategoryId;
    data['mallCategoryName'] = mallCategoryName;
    data['bxMallSubDto'] = bxMallSubDtoList != null ?
    this.bxMallSubDtoList.map((v) => v.toJson()).toList()
        : null;
    data['comments'] = comments;
    data['image'] = image;
    return data;
  }
}


class BxMallSubDto {

  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto.fromJsonMap(Map<String, dynamic> map):
        mallSubId = map["mallSubId"],
        mallCategoryId = map["mallCategoryId"],
        mallSubName = map["mallSubName"],
        comments = map["comments"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = mallSubId;
    data['mallCategoryId'] = mallCategoryId;
    data['mallSubName'] = mallSubName;
    data['comments'] = comments;
    return data;
  }
}