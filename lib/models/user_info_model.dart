import 'dart:io';

class UserInfo {
  List<Data>? data;
  String? message;
  int? status;

  UserInfo({this.data, this.message, this.status});

  UserInfo.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? motherName;
  String? fatherName;
  String? familyName;
  int? phone1;
  int? phone2;
  int? villageNumber;
  int? enlistmentStatueId;
  int? regionId;
  int? nationalIdentificationNumber;
  dynamic image;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;
  Region? region;
  EnlistmentStatue? enlistmentStatue;

  Data(
      {this.id,
      this.motherName,
      this.fatherName,
      this.familyName,
      this.phone1,
      this.phone2,
      this.villageNumber,
      this.enlistmentStatueId,
      this.regionId,
      this.nationalIdentificationNumber,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.region,
      this.enlistmentStatue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    motherName = json['mother_name'];
    fatherName = json['father_name'];
    familyName = json['family_name'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    villageNumber = json['village_number'];
    enlistmentStatueId = json['enlistment_statue_id'];
    regionId = json['region_id'];
    nationalIdentificationNumber = json['national_identification_number'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    enlistmentStatue = json['enlistment_statue'] != null
        ? EnlistmentStatue.fromJson(json['enlistment_statue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['mother_name'] = motherName;
    data['father_name'] = fatherName;
    data['family_name'] = familyName;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['village_number'] = villageNumber;
    data['enlistment_statue_id'] = enlistmentStatueId;
    data['region_id'] = regionId;
    data['national_identification_number'] = nationalIdentificationNumber;
    data['image'] = image;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (region != null) {
      data['region'] = region!.toJson();
    }
    if (enlistmentStatue != null) {
      data['enlistment_statue'] = enlistmentStatue!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? statusId;
  int? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.statusId,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    statusId = json['status_id'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['status_id'] = statusId;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Region {
  int? id;
  String? name;
  int? provincesId;

  Region({this.id, this.name, this.provincesId});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provincesId = json['provinces_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['provinces_id'] = provincesId;
    return data;
  }
}

class EnlistmentStatue {
  int? id;
  String? name;

  EnlistmentStatue({this.id, this.name});

  EnlistmentStatue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
