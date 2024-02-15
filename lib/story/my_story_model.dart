class myStoryModel {
  String? status;
  String? message;
  Data? data;

  myStoryModel({this.status, this.message, this.data});

  myStoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? total;
  List<Content>? content;

  Data({this.total, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? idNews;
  String? header;
  String? title;
  String? description;

  Content({this.idNews, this.header, this.title, this.description});

  Content.fromJson(Map<String, dynamic> json) {
    idNews = json['id_news'];
    header = json['header'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_news'] = this.idNews;
    data['header'] = this.header;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
