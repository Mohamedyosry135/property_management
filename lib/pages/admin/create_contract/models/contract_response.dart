class ContractResponse {
  String? jsonrpc;
  dynamic? id;
  Result? result;

  ContractResponse({this.jsonrpc, this.id, this.result});

  ContractResponse.fromJson( json) {
    print("jsonjson ${json}");
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    // if (this.result != null) {
    //   data['result'] = this.result!.toJson();
    // }
    return data;
  }
}

class Result {
  String? status;
  Data? data;

  Result({this.status, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? financialId;
  int? realStateId;
  dynamic contractPaymentsId;
  int? ownerId;
  dynamic ownerRepresenterId;
  int? renterId;
  dynamic renterRepresenterId;
  String? startDate;
  String? endDate;
  String? contractNumber;

  Data(
      {this.id,
        this.financialId,
        this.realStateId,
        this.contractPaymentsId,
        this.ownerId,
        this.ownerRepresenterId,
        this.renterId,
        this.renterRepresenterId,
        this.startDate,
        this.endDate,
        this.contractNumber});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    financialId = json['financial_id'];
    realStateId = json['real_state_id'];
    contractPaymentsId = json['contract_payments_id'];
    ownerId = json['owner_id'];
    ownerRepresenterId = json['owner_representer_id'];
    renterId = json['renter_id'];
    renterRepresenterId = json['renter_representer_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    contractNumber = json['contract_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['financial_id'] = this.financialId;
    data['real_state_id'] = this.realStateId;
    data['contract_payments_id'] = this.contractPaymentsId;
    data['owner_id'] = this.ownerId;
    data['owner_representer_id'] = this.ownerRepresenterId;
    data['renter_id'] = this.renterId;
    data['renter_representer_id'] = this.renterRepresenterId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['contract_number'] = this.contractNumber;
    return data;
  }
}
