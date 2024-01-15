class Categories {
  String? status;
  String? message;
  List<Data>? data;

  Categories({this.status, this.message, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? icon;
  String? category;

  Data({this.id, this.icon, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['category'] = this.category;
    return data;
  }
}

class Category {
  int? id;
  String? icon;
  String? category;
  Category({this.id, this.icon, this.category});
}

class ChipsCategory {
  int? id;
  String? icon;
  String? category;
  bool? selected;
  ChipsCategory({this.id, this.icon, this.category, this.selected});
}
