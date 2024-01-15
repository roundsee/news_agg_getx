class ListHistoryModel {
  String? status;
  String? message;
  List<Data>? data;

  ListHistoryModel({this.status, this.message, this.data});

  ListHistoryModel.fromJson(Map<String, dynamic> json) {
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
  Content? content;

  Data({this.content});

  Data.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    return data;
  }
}

class Content {
  String? id;
  String? publish;
  String? category;
  String? title;
  String? header;
  String? ago;

  Content(
      {this.id,
      this.publish,
      this.category,
      this.title,
      this.header,
      this.ago});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publish = json['publish'];
    category = json['category'];
    title = json['title'];
    header = json['header'];
    ago = json['ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['publish'] = this.publish;
    data['category'] = this.category;
    data['title'] = this.title;
    data['header'] = this.header;
    data['ago'] = this.ago;
    return data;
  }
}
