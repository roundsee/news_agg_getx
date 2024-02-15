class StoryModel {
  List<DataStory>? data;

  StoryModel({this.data});

  StoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataStory>[];
      json['data'].forEach((v) {
        data!.add(new DataStory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataStory {
  String? mediaType;
  String? media;
  String? duration;
  String? caption;
  String? when;
  String? color;

  DataStory(
      {this.mediaType,
      this.media,
      this.duration,
      this.caption,
      this.when,
      this.color});

  DataStory.fromJson(Map<String, dynamic> json) {
    mediaType = json['mediaType'];
    media = json['media'];
    duration = json['duration'];
    caption = json['caption'];
    when = json['when'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mediaType'] = this.mediaType;
    data['media'] = this.media;
    data['duration'] = this.duration;
    data['caption'] = this.caption;
    data['when'] = this.when;
    data['color'] = this.color;
    return data;
  }
}
