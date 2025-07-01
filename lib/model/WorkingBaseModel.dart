class WorkingBaseModel {
  WorkingBaseModel({
      this.status, 
      this.message, 
      this.data,});

  WorkingBaseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.title, 
      this.description, 
      this.imageUrl, 
      this.liveUrl,});

  Data.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    liveUrl = json['liveUrl'];
  }
  String? title;
  String? description;
  String? imageUrl;
  String? liveUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['liveUrl'] = liveUrl;
    return map;
  }

}