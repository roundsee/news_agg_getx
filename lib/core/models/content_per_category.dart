class ContentPerCategory {
  String? status;
  String? message;
  List<Data>? data;

  ContentPerCategory({this.status, this.message, this.data});

  ContentPerCategory.fromJson(Map<String, dynamic> json) {
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
  String? source;
  String? publish;
  String? category;
  String? title;
  String? description;
  String? slug;
  String? header;
  Statistics? statistics;
  Interaction? interaction;

  Content(
      {this.id,
      this.source,
      this.publish,
      this.category,
      this.title,
      this.description,
      this.slug,
      this.header,
      this.statistics,
      this.interaction});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    publish = json['publish'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
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
    data['id'] = this.id;
    data['source'] = this.source;
    data['publish'] = this.publish;
    data['category'] = this.category;
    data['title'] = this.title;
    data['description'] = this.description;
    data['slug'] = this.slug;
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
