class UserUpdateModel {
  String? name;
  String? verificationId;
  String? birthdate;
  String? phone;
  String? realstateNumber;
  String? realstateEndsDate;
  String? email;

  UserUpdateModel(
      {this.name,
        this.verificationId,
        this.birthdate,
        this.phone,
        this.realstateNumber,
        this.realstateEndsDate,
        this.email});

  UserUpdateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    verificationId = json['verification_id'];
    birthdate = json['birthdate'];
    phone = json['phone'];
    realstateNumber = json['realstate_number'];
    realstateEndsDate = json['realstate_ends_date'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['verification_id'] = this.verificationId;
    data['birthdate'] = this.birthdate;
    data['phone'] = this.phone;
    data['realstate_number'] = this.realstateNumber;
    data['realstate_ends_date'] = this.realstateEndsDate;
    data['email'] = this.email;
    return data;
  }
}
