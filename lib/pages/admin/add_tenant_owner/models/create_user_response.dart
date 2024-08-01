class CreateUserResponse {
  String? jsonrpc;
  dynamic id;
  Result? result;

  CreateUserResponse({this.jsonrpc, this.id, this.result});

  CreateUserResponse.fromJson( json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  int? id;
  String? status;
  String? error;

  int? statusCode;

  Result({this.id, this.status, this.statusCode, this.error});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    error = json['error'];

    status = json['status'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['error'] = this.error;

    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    return data;
  }
}
