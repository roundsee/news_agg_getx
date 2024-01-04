class NewsTrend {
  String? status;
  String? message;
  List<Data>? data;

  NewsTrend({this.status, this.message, this.data});

  NewsTrend.fromJson(Map<String, dynamic> json) {
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
  String? id;
  int? category;
  String? publish;
  String? title;
  String? header;
  int? totalCount;
  int? totalView;

  Data(
      {this.id,
      this.category,
      this.publish,
      this.title,
      this.header,
      this.totalCount,
      this.totalView});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    publish = json['publish'];
    title = json['title'];
    header = json['header'];
    totalCount = json['total_count'];
    totalView = json['total_view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['publish'] = this.publish;
    data['title'] = this.title;
    data['header'] = this.header;
    data['total_count'] = this.totalCount;
    data['total_view'] = this.totalView;
    return data;
  }
}
