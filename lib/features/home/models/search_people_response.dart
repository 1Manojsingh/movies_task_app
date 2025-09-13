class SearchPeopleResponse {
  int? status;
  String? message;
  Data? data;

  SearchPeopleResponse({this.status, this.message, this.data});

  SearchPeopleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<People>? peopleList;
  int? total;

  Data({this.peopleList, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['peopleList'] != null) {
      peopleList = <People>[];
      json['peopleList'].forEach((v) {
        peopleList!.add(People.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (peopleList != null) {
      data['peopleList'] = peopleList!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class People {
  String? id;
  String? email;
  String? fullName;
  String? username;
  String? avatar;
  String? banner;
  String? bio;
  int? totalEarning;
  int? totalSpending;
  String? averageRate;
  int? rating;
  String? successRatePercentage;
  int? milestoneCompletedCount;

  People(
      {this.id,
        this.email,
        this.fullName,
        this.username,
        this.avatar,
        this.banner,
        this.bio,
        this.totalEarning,
        this.totalSpending,
        this.averageRate,
        this.rating,
        this.successRatePercentage,
        this.milestoneCompletedCount});

  People.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    username = json['username'];
    avatar = json['avatar'];
    banner = json['banner'];
    bio = json['bio'];
    totalEarning = json['totalEarning'];
    totalSpending = json['totalSpending'];
    averageRate = json['averageRate'];
    rating = json['rating'];
    successRatePercentage = json['successRatePercentage'];
    milestoneCompletedCount = json['milestoneCompletedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullName'] = fullName;
    data['username'] = username;
    data['avatar'] = avatar;
    data['banner'] = banner;
    data['bio'] = bio;
    data['totalEarning'] = totalEarning;
    data['totalSpending'] = totalSpending;
    data['averageRate'] = averageRate;
    data['rating'] = rating;
    data['successRatePercentage'] = successRatePercentage;
    data['milestoneCompletedCount'] = milestoneCompletedCount;
    return data;
  }
}
