class ConstantsLists {
  String? status;
  Data? data;
  int? statusCode;

  ConstantsLists({this.status, this.data, this.statusCode});

  ConstantsLists.fromJson(Map<String, dynamic> json) {
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
  double? taxPercentage;
  double? additionalFee;
  int? realstateCount;
  int? contractCount;
  int? ownerCount;
  int? renterCount;

  List<String>? paymentCycles;
  List<String>? propertyTypes;
  List<String>? propertyUsages;

  List<String>? cities;
  List<String>? neighborhoods;

  Data(
      {this.taxPercentage,
        this.additionalFee,
        this.realstateCount,
        this.propertyUsages,
        this.contractCount,
        this.ownerCount,
        this.renterCount,
        this.paymentCycles,
        this.propertyTypes,
        this.cities,
        this.neighborhoods});

  Data.fromJson(Map<String, dynamic> json) {
    taxPercentage = double.tryParse(json['tax_percentage'].toString());
    additionalFee = json['additional_fee'];
    paymentCycles = json['payment_cycles'].cast<String>();
    propertyTypes = json['property_types'].cast<String>();
    propertyUsages =  json['property_usage'].cast<String>();
     realstateCount = json['realstate_count'];
     contractCount= json['contract_count'];
     ownerCount= json['owner_count'];
    renterCount= json['renter_count'];
    cities = json['cities'].cast<String>();
    neighborhoods = json['neighborhoods'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_percentage'] = this.taxPercentage;
    data['additional_fee'] = this.additionalFee;
    data['payment_cycles'] = this.paymentCycles;
    data['property_types'] = this.propertyTypes;
    data['property_usage'] = this.propertyUsages;

    data['cities'] = this.cities;
    data['neighborhoods'] = this.neighborhoods;
    return data;
  }
}
