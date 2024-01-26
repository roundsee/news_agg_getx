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
  SuggestionContent? content;
  Statistics? statistics;

  Data({this.content, this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    content = json['content'] != null
        ? new SuggestionContent.fromJson(json['content'])
        : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class SuggestionContent {
  String? id;
  String? datePublish;
  String? author;
  String? header;
  String? category;
  String? title;
  String? slug;
  String? tag;
  num? similarity;

  SuggestionContent(
      {this.id,
      this.datePublish,
      this.author,
      this.header,
      this.category,
      this.title,
      this.slug,
      this.tag,
      this.similarity});

  SuggestionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datePublish = json['date_publish'];
    author = json['author'];
    header = json['header'];
    category = json['category'];
    title = json['title'];
    slug = json['slug'];
    tag = json['tag'];
    similarity = json['similarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_publish'] = this.datePublish;
    data['author'] = this.author;
    data['header'] = this.header;
    data['category'] = this.category;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['tag'] = this.tag;
    data['similarity'] = this.similarity;
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
