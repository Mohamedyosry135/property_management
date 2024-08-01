class UpdateProfile {
  String? jsonrpc;
  Null? id;
  Result? result;

  UpdateProfile({this.jsonrpc, this.id, this.result});

  UpdateProfile.fromJson(json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? status;
  Data? data;
  int? statusCode;

  Result({this.status, this.data, this.statusCode});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? image;
  String? verificationId;
  String? birthdate;
  String? phone;
  String? realstateNumber;
  String? realstateEndsDate;
  String? email;
  String? role;

  Data(
      {this.id,
        this.name,
        this.image,
        this.verificationId,
        this.birthdate,
        this.phone,
        this.realstateNumber,
        this.realstateEndsDate,
        this.email,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    verificationId = json['verification_id'];
    birthdate = json['birthdate'];
    phone = json['phone'];
    realstateNumber = json['realstate_number'];
    realstateEndsDate = json['realstate_ends_date'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['verification_id'] = this.verificationId;
    data['birthdate'] = this.birthdate;
    data['phone'] = this.phone;
    data['realstate_number'] = this.realstateNumber;
    data['realstate_ends_date'] = this.realstateEndsDate;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
