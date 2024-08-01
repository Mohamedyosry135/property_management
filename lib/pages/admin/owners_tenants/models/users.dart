class Users {
  int? id;
  String? name;
  String? image;
  String? verificationId;
  String? birthdate;
  String? phone;
  String? realstateNumber;
  String? realstateEndsDate;
  String? email;
  String? role;

  Users(
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

  Users.fromJson( json) {
    print("json ${json}");
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

  @override
  String toString() {
    return name ?? "";
  }
}
