class Transactions {
  List<Data>? data;
  String? message;
  int? status;

  Transactions({this.data, this.message, this.status});

  Transactions.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? motherName;
  String? fatherName;
  String? familyName;
  int? phone1;
  String? villageNumber;
  int? nationalIdentificationNumber;
  String? frontFaceOfIdentity;
  String? backFaceOfIdentity;
  String? attachedImage;
  String? userImage;
  int? enlistmentStatueId;
  int? regionId;
  int? provinceId;
  int? transactiontypeId;
  int? regionConsent;
  int? provincesConsent;
  int? userId;
  String? notes;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  User? user;
  Region? region;
  Province? province;
  Province? enlistmentStatue;
  Transactiontype? transactiontype;

  Data(
      {this.id,
      this.name,
      this.motherName,
      this.fatherName,
      this.familyName,
      this.phone1,
      this.villageNumber,
      this.nationalIdentificationNumber,
      this.frontFaceOfIdentity,
      this.backFaceOfIdentity,
      this.attachedImage,
      this.userImage,
      this.enlistmentStatueId,
      this.regionId,
      this.provinceId,
      this.transactiontypeId,
      this.regionConsent,
      this.provincesConsent,
      this.userId,
      this.notes,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.region,
      this.province,
      this.enlistmentStatue,
      this.transactiontype});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    motherName = json['mother_name'];
    fatherName = json['father_name'];
    familyName = json['family_name'];
    phone1 = json['phone1'];
    villageNumber = json['village_number'];
    nationalIdentificationNumber = json['national_identification_number'];
    frontFaceOfIdentity = json['front_face_of_identity'];
    backFaceOfIdentity = json['back_face_of_identity'];
    attachedImage = json['attached_image'];
    userImage = json['user_image'];
    enlistmentStatueId = json['enlistment_statue_id'];
    regionId = json['region_id'];
    provinceId = json['province_id'];
    transactiontypeId = json['transactiontype_id'];
    regionConsent = json['region_consent'];
    provincesConsent = json['provinces_consent'];
    userId = json['user_id'];
    notes = json['notes'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    enlistmentStatue = json['enlistment_statue'] != null
        ? Province.fromJson(json['enlistment_statue'])
        : null;
    transactiontype = json['transactiontype'] != null
        ? Transactiontype.fromJson(json['transactiontype'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['mother_name'] = motherName;
    data['father_name'] = fatherName;
    data['family_name'] = familyName;
    data['phone1'] = phone1;
    data['village_number'] = villageNumber;
    data['national_identification_number'] = nationalIdentificationNumber;
    data['front_face_of_identity'] = frontFaceOfIdentity;
    data['back_face_of_identity'] = backFaceOfIdentity;
    data['attached_image'] = attachedImage;
    data['user_image'] = userImage;
    data['enlistment_statue_id'] = enlistmentStatueId;
    data['region_id'] = regionId;
    data['province_id'] = provinceId;
    data['transactiontype_id'] = transactiontypeId;
    data['region_consent'] = regionConsent;
    data['provinces_consent'] = provincesConsent;
    data['user_id'] = userId;
    data['notes'] = notes;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (region != null) {
      data['region'] = region!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (enlistmentStatue != null) {
      data['enlistment_statue'] = enlistmentStatue!.toJson();
    }
    if (transactiontype != null) {
      data['transactiontype'] = transactiontype!.toJson();
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

class Province {
  int? id;
  String? name;

  Province({this.id, this.name});

  Province.fromJson(Map<String, dynamic> json) {
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

class Transactiontype {
  int? id;
  String? type;

  Transactiontype({this.id, this.type});

  Transactiontype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
