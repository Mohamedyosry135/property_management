class ContractPaymentsBondModel {
  String? status;
  List<ContractPayment>? data;
  String? message;
  int? statusCode;

  ContractPaymentsBondModel(
      {this.status, this.data, this.message, this.statusCode});

  ContractPaymentsBondModel.fromJson( json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ContractPayment>[];
      json['data'].forEach((v) {
        data!.add(new ContractPayment.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class ContractPayment {
  int? id;
  int? contractId;
  String? name;
  dynamic? price;
  dynamic? taxAmount;
  dynamic? totalPrice;
  String? paymentDeadline;
  bool? isPaid;
  bool? isDocument;


  ContractPayment(
      {this.id,
        this.contractId,
        this.name,
        this.price,
        this.taxAmount,
        this.totalPrice,
        this.paymentDeadline,
        this.isDocument,
        this.isPaid});

  ContractPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    name = json['name'];
    price = json['price'];
    taxAmount = json['tax_amount'];
    totalPrice = json['total_price'];
    paymentDeadline = json['payment_deadline'];
    isPaid = json['is_paid'];
    isDocument = json['is_document'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['price'] = this.price;
    data['tax_amount'] = this.taxAmount;
    data['total_price'] = this.totalPrice;
    data['payment_deadline'] = this.paymentDeadline;
    data['is_paid'] = this.isPaid;
    data['is_document'] = this.isDocument;

    return data;
  }
}
