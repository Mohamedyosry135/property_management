

class ProfileDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? token;

  ProfileDataModel({this.id, this.name, this.email, this.phone, this.role, this.token});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['token'] = token;
    return data;
  }
}
