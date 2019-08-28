import 'package:json_annotation/json_annotation.dart';

part 'goods_detail.g.dart';


@JsonSerializable()
class GoodsDetailModel extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  GoodsDataBean data;

  GoodsDetailModel(this.code,this.message,this.data,);

  factory GoodsDetailModel.fromJson(Map<String, dynamic> srcJson) => _$GoodsDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailModelToJson(this);

}


@JsonSerializable()
class GoodsDataBean extends Object {

  @JsonKey(name: 'goodInfo')
  GoodInfo goodInfo;

  @JsonKey(name: 'goodComments')
  List<GoodComments> goodComments;

  @JsonKey(name: 'advertesPicture')
  AdvertesPicture advertesPicture;

  GoodsDataBean(this.goodInfo,this.goodComments,this.advertesPicture,);

  factory GoodsDataBean.fromJson(Map<String, dynamic> srcJson) => _$DataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);

}


@JsonSerializable()
class GoodInfo extends Object {

  @JsonKey(name: 'image5')
  String image5;

  @JsonKey(name: 'amount')
  int amount;

  @JsonKey(name: 'image3')
  String image3;

  @JsonKey(name: 'image4')
  String image4;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'isOnline')
  String isOnline;

  @JsonKey(name: 'image1')
  String image1;

  @JsonKey(name: 'image2')
  String image2;

  @JsonKey(name: 'goodsSerialNumber')
  String goodsSerialNumber;

  @JsonKey(name: 'oriPrice')
  double oriPrice;

  @JsonKey(name: 'presentPrice')
  double presentPrice;

  @JsonKey(name: 'comPic')
  String comPic;

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'shopId')
  String shopId;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsDetail')
  String goodsDetail;

  GoodInfo(this.image5,this.amount,this.image3,this.image4,this.goodsId,this.isOnline,this.image1,this.image2,this.goodsSerialNumber,this.oriPrice,this.presentPrice,this.comPic,this.state,this.shopId,this.goodsName,this.goodsDetail,);

  factory GoodInfo.fromJson(Map<String, dynamic> srcJson) => _$GoodInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodInfoToJson(this);

}


@JsonSerializable()
class GoodComments extends Object {

  @JsonKey(name: 'SCORE')
  int sCORE;

  @JsonKey(name: 'comments')
  String comments;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'discussTime')
  int discussTime;

  GoodComments(this.sCORE,this.comments,this.userName,this.discussTime,);

  factory GoodComments.fromJson(Map<String, dynamic> srcJson) => _$GoodCommentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodCommentsToJson(this);

}


@JsonSerializable()
class AdvertesPicture extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  AdvertesPicture(this.pICTUREADDRESS,this.tOPLACE,);

  factory AdvertesPicture.fromJson(Map<String, dynamic> srcJson) => _$AdvertesPictureFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdvertesPictureToJson(this);

}

/// {"code":"0","message":"success","data":{"goodInfo":{"image5":"","amount":10000,"image3":"","image4":"","goodsId":"ed675dda49e0445fa769f3d8020ab5e9","isOnline":"yes","image1":"http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg","image2":"","goodsSerialNumber":"6928804011173","oriPrice":3.00,"presentPrice":2.70,"comPic":"http://images.baixingliangfan.cn/compressedPic/20190116162618_2924.jpg","state":1,"shopId":"402880e860166f3c0160167897d60002","goodsName":"可口可乐500ml/瓶","goodsDetail":"<img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_5060.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_1063.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8029.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8439.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_6800.jpg\" width=\"100%\" height=\"auto\" alt=\"\" />"},"goodComments":[{"SCORE":5,"comments":"果断卸载，2.5个小时才送到","userName":"157******27","discussTime":1539491266336}],"advertesPicture":{"PICTURE_ADDRESS":"http://images.baixingliangfan.cn/advertesPicture/20190113/20190113134955_5825.jpg","TO_PLACE":"1"}}}

