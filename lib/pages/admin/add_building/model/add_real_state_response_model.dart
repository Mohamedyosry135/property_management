class AddRealStateResponseModel {
  String? jsonrpc;
  dynamic id;
  List<Result>? result;

  AddRealStateResponseModel({this.jsonrpc, this.id, this.result});

  AddRealStateResponseModel.fromJson(json) {
    print("jsonjson ${json}");
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
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
  String? identifier;
  String? city;
  String? neighborhood;
  String? usageType;
  String? type;
  int? ownerId;
  dynamic area;
  List<dynamic>? maintenanceIds;
  List<dynamic>? contractIds;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identifier = json['identifier'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    usageType = json['usage_type'];
    type = json['type'];
    ownerId = json['owner_id'];
    area = json['area'];
    if (json['maintenance_ids'] != null) {
      maintenanceIds = <Null>[];
      json['maintenance_ids'].forEach((v) {
        maintenanceIds!.add(v);
      });
    }
    if (json['contract_ids'] != null) {
      contractIds = <Null>[];
      json['contract_ids'].forEach((v) {
        contractIds!.add(v);
      });
    }
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
    if (this.maintenanceIds != null) {
      data['maintenance_ids'] =
          this.maintenanceIds!.map((v) => v.toJson()).toList();
    }
    if (this.contractIds != null) {
      data['contract_ids'] = this.contractIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
