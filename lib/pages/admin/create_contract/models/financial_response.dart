class FinanicalResponse {
  String? jsonrpc;
  dynamic? id;
  Result? result;

  FinanicalResponse({this.jsonrpc, this.id, this.result});

  FinanicalResponse.fromJson( json) {
    print("json ${json}");
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
  String? message;
  int? statusCode;

  Result({this.status, this.data, this.message, this.statusCode});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  double? price;
  double? taxAmount;
  double? electricityTax;
  double? waterTax;
  double? cleaningTax;
  double? managementTax;
  double? tammemPercentage;
  double? totalPrice;
  List<dynamic>? contractIds;

  Data(
      {this.id,
        this.type,
        this.price,
        this.taxAmount,
        this.electricityTax,
        this.waterTax,
        this.cleaningTax,
        this.managementTax,
        this.tammemPercentage,
        this.totalPrice,
        this.contractIds});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    taxAmount = json['tax_amount'];
    electricityTax = json['electricity_tax'];
    waterTax = json['water_tax'];
    cleaningTax = json['cleaning_tax'];
    managementTax = json['management_tax'];
    tammemPercentage = json['tammem_percentage'];
    totalPrice = json['total_price'];
    // if (json['contract_ids'] != null) {
    //   contractIds = <dynamic>[];
    //   json['contract_ids'].forEach((v) {
    //     contractIds!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['price'] = this.price;
    data['tax_amount'] = this.taxAmount;
    data['electricity_tax'] = this.electricityTax;
    data['water_tax'] = this.waterTax;
    data['cleaning_tax'] = this.cleaningTax;
    data['management_tax'] = this.managementTax;
    data['tammem_percentage'] = this.tammemPercentage;
    data['total_price'] = this.totalPrice;
    if (this.contractIds != null) {
      data['contract_ids'] = this.contractIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
