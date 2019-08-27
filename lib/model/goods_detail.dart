import 'package:json_annotation/json_annotation.dart';

part 'goods_detail.g.dart';


@JsonSerializable()
class GoodsDetailModel extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  DataBean data;

  GoodsDetailModel(this.code,this.message,this.data,);

  factory GoodsDetailModel.fromJson(Map<String, dynamic> srcJson) => _$GoodsDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailModelToJson(this);

}


@JsonSerializable()
class DataBean extends Object {

  @JsonKey(name: 'goodInfo')
  GoodInfo goodInfo;

  @JsonKey(name: 'goodComments')
  List<GoodComments> goodComments;

  @JsonKey(name: 'advertesPicture')
  AdvertesPicture advertesPicture;

  DataBean(this.goodInfo,this.goodComments,this.advertesPicture,);

  factory DataBean.fromJson(Map<String, dynamic> srcJson) => _$DataBeanFromJson(srcJson);

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


