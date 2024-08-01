class AddMaintenanceResponse {
  String? jsonrpc;
  dynamic id;
  Result? result;

  AddMaintenanceResponse({this.jsonrpc, this.id, this.result});

  AddMaintenanceResponse.fromJson(json) {
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
  String? details;
  String? status;
  int? userId;
  int? realStateId;

  Data({this.id, this.details, this.status, this.userId, this.realStateId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    status = json['status'];
    userId = json['user_id'];
    realStateId = json['real_state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['real_state_id'] = this.realStateId;
    return data;
  }
}
