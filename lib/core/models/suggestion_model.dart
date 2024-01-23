class SuggestionNews {
  String? status;
  List<Data>? data;

  SuggestionNews({this.status, this.data});

  SuggestionNews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
  String? source;
  String? datePublish;
  String? author;
  String? category;
  String? title;
  String? slug;
  String? tag;
  double? similarity;

  Content(
      {this.id,
      this.source,
      this.datePublish,
      this.author,
      this.category,
      this.title,
      this.slug,
      this.tag,
      this.similarity});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    datePublish = json['date_publish'];
    author = json['author'];
    category = json['category'];
    title = json['title'];
    slug = json['slug'];
    tag = json['tag'];
    similarity = json['similarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['date_publish'] = this.datePublish;
    data['author'] = this.author;
    data['category'] = this.category;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['tag'] = this.tag;
    data['similarity'] = this.similarity;
    return data;
  }
}
