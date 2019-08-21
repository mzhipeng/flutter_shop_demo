class GoodsDetailModel {
  String code;
  String message;
  GoodsDetail data;

  GoodsDetailModel.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        message = map["message"],
        data = GoodsDetail.fromJsonMap(map["data"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['code'] = code;
    map['message'] = message;
    map['data'] = map == null ? null : data.toJson();
    return map;
  }
}

class GoodsDetail {
  GoodInfo goodInfo;
  List<GoodComments> goodComments;
  AdvertesPicture advertesPicture;

  GoodsDetail.fromJsonMap(Map<String, dynamic> map)
      : goodInfo = GoodInfo.fromJsonMap(map["goodInfo"]),
        goodComments = List<GoodComments>.from(
            map["goodComments"].map((it) => GoodComments.fromJsonMap(it))),
        advertesPicture = AdvertesPicture.fromJsonMap(map["advertesPicture"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodInfo'] = goodInfo == null ? null : goodInfo.toJson();
    data['goodComments'] = goodComments != null
        ? this.goodComments.map((v) => v.toJson()).toList()
        : null;
    data['advertesPicture'] =
        advertesPicture == null ? null : advertesPicture.toJson();
    return data;
  }
}

class GoodInfo {
  String image5;
  int amount;
  String image3;
  String image4;
  String goodsId;
  String isOnline;
  String image1;
  String image2;
  String goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String goodsName;
  String goodsDetail;

  GoodInfo.fromJsonMap(Map<String, dynamic> map)
      : image5 = map["image5"],
        amount = map["amount"],
        image3 = map["image3"],
        image4 = map["image4"],
        goodsId = map["goodsId"],
        isOnline = map["isOnline"],
        image1 = map["image1"],
        image2 = map["image2"],
        goodsSerialNumber = map["goodsSerialNumber"],
        oriPrice = map["oriPrice"],
        presentPrice = map["presentPrice"],
        comPic = map["comPic"],
        state = map["state"],
        shopId = map["shopId"],
        goodsName = map["goodsName"],
        goodsDetail = map["goodsDetail"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image5'] = image5;
    data['amount'] = amount;
    data['image3'] = image3;
    data['image4'] = image4;
    data['goodsId'] = goodsId;
    data['isOnline'] = isOnline;
    data['image1'] = image1;
    data['image2'] = image2;
    data['goodsSerialNumber'] = goodsSerialNumber;
    data['oriPrice'] = oriPrice;
    data['presentPrice'] = presentPrice;
    data['comPic'] = comPic;
    data['state'] = state;
    data['shopId'] = shopId;
    data['goodsName'] = goodsName;
    data['goodsDetail'] = goodsDetail;
    return data;
  }
}

class GoodComments {
  int score;
  String comments;
  String userName;
  int discussTime;

  GoodComments.fromJsonMap(Map<String, dynamic> map)
      : score = map["SCORE"],
        comments = map["comments"],
        userName = map["userName"],
        discussTime = map["discussTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCORE'] = score;
    data['comments'] = comments;
    data['userName'] = userName;
    data['discussTime'] = discussTime;
    return data;
  }
}

class AdvertesPicture {
  String pictureAddress;
  String toPlace;

  AdvertesPicture.fromJsonMap(Map<String, dynamic> map)
      : pictureAddress = map["PICTURE_ADDRESS"],
        toPlace = map["TO_PLACE"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = pictureAddress;
    data['TO_PLACE'] = toPlace;
    return data;
  }
}
