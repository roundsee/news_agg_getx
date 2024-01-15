class SearchResult {
  String? status;
  String? message;
  Data? data;

  SearchResult({this.status, this.message, this.data});

  SearchResult.fromJson(Map<String, dynamic> json) {
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
  List<ContentSearchResult>? content;

  Data({this.content});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <ContentSearchResult>[];
      json['content'].forEach((v) {
        content!.add(new ContentSearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentSearchResult {
  String? id;
  String? title;
  String? datePublish;
  String? category;
  String? header;

  ContentSearchResult(
      {this.id, this.title, this.datePublish, this.category, this.header});

  ContentSearchResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    datePublish = json['date_publish'];
    category = json['category'];
    header = json['header'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date_publish'] = this.datePublish;
    data['category'] = this.category;
    data['header'] = this.header;
    return data;
  }
}
