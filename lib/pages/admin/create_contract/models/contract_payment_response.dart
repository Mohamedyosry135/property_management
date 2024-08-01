class   ContractPaymentResponse {
  String? jsonrpc;
  dynamic? id;
  Result? result;

  ContractPaymentResponse({this.jsonrpc, this.id, this.result});

  ContractPaymentResponse.fromJson(json) {

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
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  int? contractId;
  String? name;
  double? price;
  double? taxAmount;
  double? totalPrice;
  String? paymentDeadline;
  bool? isPaid;

  Data(
      {this.id,
        this.contractId,
        this.name,
        this.price,
        this.taxAmount,
        this.totalPrice,
        this.paymentDeadline,
        this.isPaid});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    name = json['name'];
    price = json['price'];
    taxAmount = json['tax_amount'];
    totalPrice = json['total_price'];
    paymentDeadline = json['payment_deadline'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_id'] = this.contractId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['tax_amount'] = this.taxAmount;
    data['total_price'] = this.totalPrice;
    data['payment_deadline'] = this.paymentDeadline;
    data['is_paid'] = this.isPaid;
    return data;
  }
}
