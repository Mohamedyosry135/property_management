import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentsRequest {
  bool? bulk;
  List<ContractPaymentRequest>? contracts;

  PaymentsRequest({this.bulk, this.contracts});

  PaymentsRequest.fromJson(Map<String, dynamic> json) {
    bulk = json['bulk'];
    if (json['contracts'] != null) {
      contracts = <ContractPaymentRequest>[];
      json['contracts'].forEach((v) {
        contracts!.add(new ContractPaymentRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bulk'] = this.bulk;
    if (this.contracts != null) {
      data['contracts'] = this.contracts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ContractPaymentRequest {
  String? name;
  double? price;
  double? taxAmount;
  String? paymentDeadline;
  bool? isPaid = false;
  bool? isDocument = false;

  int? contractId;
  RxBool? isPaidRx = false.obs;

  TextEditingController? paymentDeadlineController;
  TextEditingController? taxController;
  TextEditingController? pricelineController ;
  TextEditingController? nameController;

  ContractPaymentRequest(
      {this.name,
        this.price,
        this.taxAmount,
        this.paymentDeadline,
        this.isPaid=false,
        this.isDocument=false,

        this.contractId,
        this.isPaidRx ,
        this.paymentDeadlineController,
        this.taxController,
        this.pricelineController,
        this.nameController

      });

  ContractPaymentRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    taxAmount = json['tax_amount'];
    paymentDeadline = json['payment_deadline'];
    isPaid = json['is_paid'];
    isDocument = json['is_document'];

    contractId = json['contract_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['tax_amount'] = this.taxAmount;
    data['payment_deadline'] = this.paymentDeadline;
    data['is_document'] = this.isDocument;

    data['is_paid'] = this.isPaid;
    data['contract_id'] = this.contractId;
    return data;
  }
}
