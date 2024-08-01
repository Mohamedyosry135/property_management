class RealStatesModel {
  int? id;
  String? name;
  String? identifier;
  dynamic city;
  dynamic neighborhood;
  dynamic usageType;
  dynamic type;
  int? ownerId;
  dynamic area;
  List<int>? maintenanceIds;
  List<int>? contractIds;

  RealStatesModel(
      {this.id,
        this.name,
        this.identifier,
        this.city,
        this.neighborhood,
        this.usageType,
        this.type,
        this.ownerId,
        this.area,
        this.maintenanceIds,
        this.contractIds});

  RealStatesModel.fromJson(json) {
    print('jsonjson ${json}');
    id = json['id'];
    name = json['name'];
    identifier = json['identifier'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    usageType = json['usage_type'];
    type = json['type'];
    ownerId = json['owner_id'];
    area = json['area'];
    maintenanceIds = json['maintenance_ids'].cast<int>();
    contractIds = json['contract_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['identifier'] = this.identifier;
    data['city'] = this.city;
    data['neighborhood'] = this.neighborhood;
    data['usage_type'] = this.usageType;
    data['type'] = this.type;
    data['owner_id'] = this.ownerId;
    data['area'] = this.area;
    data['maintenance_ids'] = this.maintenanceIds;
    data['contract_ids'] = this.contractIds;
    return data;
  }

  @override
  String toString() {
    return name ?? "";
  }
}
