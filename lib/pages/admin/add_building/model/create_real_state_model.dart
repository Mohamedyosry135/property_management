class CreateRealStateModel {
  String? name;
  String? identifier;
  String? city;
  String? neighborhood;
  String? usageType;
  String? type;
  int? ownerId;
  double? area;

  CreateRealStateModel(
      {this.name,
        this.identifier,
        this.city,
        this.neighborhood,
        this.usageType,
        this.type,
        this.ownerId,
        this.area});

  CreateRealStateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    identifier = json['identifier'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    usageType = json['usage_type'];
    type = json['type'];
    ownerId = json['owner_id'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['identifier'] = this.identifier;
    data['city'] = this.city;
    data['neighborhood'] = this.neighborhood;
    data['usage_type'] = this.usageType;
    data['type'] = this.type;
    data['owner_id'] = this.ownerId;
    data['area'] = this.area;
    return data;
  }
}
