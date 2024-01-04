class NewsDetailModel {
  String? status;
  String? message;
  Data? data;

  NewsDetailModel({this.status, this.message, this.data});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? source;
  String? publish;
  String? author;
  String? category;
  String? title;
  String? slug;
  String? body;
  String? header;
  Statistics? statistics;
  Interaction? interaction;

  Content(
      {this.source,
      this.publish,
      this.author,
      this.category,
      this.title,
      this.slug,
      this.body,
      this.header,
      this.statistics,
      this.interaction});

  Content.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    publish = json['publish'];
    author = json['author'];
    category = json['category'];
    title = json['title'];
    slug = json['slug'];
    body = json['body'];
    header = json['header'];
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    interaction = json['interaction'] != null
        ? new Interaction.fromJson(json['interaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['publish'] = this.publish;
    data['author'] = this.author;
    data['category'] = this.category;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['body'] = this.body;
    data['header'] = this.header;
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    if (this.interaction != null) {
      data['interaction'] = this.interaction!.toJson();
    }
    return data;
  }
}

class Statistics {
  int? like;
  int? save;
  int? share;

  Statistics({this.like, this.save, this.share});

  Statistics.fromJson(Map<String, dynamic> json) {
    like = json['like'];
    save = json['save'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['like'] = this.like;
    data['save'] = this.save;
    data['share'] = this.share;
    return data;
  }
}

class Interaction {
  int? like;
  int? save;

  Interaction({this.like, this.save});

  Interaction.fromJson(Map<String, dynamic> json) {
    like = json['like'];
    save = json['save'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['like'] = this.like;
    data['save'] = this.save;
    return data;
  }
}
