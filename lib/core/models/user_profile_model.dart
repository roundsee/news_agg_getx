class UserProfile {
  String? status;
  String? message;
  Data? data;
  Interaction? interaction;

  UserProfile({this.status, this.message, this.data, this.interaction});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    interaction = json['interaction'] != null
        ? new Interaction.fromJson(json['interaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.interaction != null) {
      data['interaction'] = this.interaction!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  int? status;
  String? birthday;
  String? gender;
  String? photo;

  Data(
      {this.id,
      this.name,
      this.email,
      this.status,
      this.birthday,
      this.gender,
      this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    birthday = json['birthday'];
    gender = json['gender'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['photo'] = this.photo;
    return data;
  }
}

class Interaction {
  int? totallike;
  int? totalsave;

  Interaction({this.totallike, this.totalsave});

  Interaction.fromJson(Map<String, dynamic> json) {
    totallike = json['totallike'];
    totalsave = json['totalsave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totallike'] = this.totallike;
    data['totalsave'] = this.totalsave;
    return data;
  }
}
