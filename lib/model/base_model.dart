/// create by MZP 2019-08-15 16:56
///
///
///
/// @author: mzp
///

class BaseModel<T extends Object> {
  String code;
  String message;
  T data;

//  BaseModel.fromJsonMap(Map<String, dynamic> map)
//      : code = map["code"],
//        message = map["message"],
//        data = map["data"] as T.fromJsonMap();
}
