class FinancialDataModel {
  int? id;
  String? type;
  int? price;
  double? taxAmount;
  int? electricityTax;
  int? waterTax;
  int? cleaningTax;
  int? managementTax;
  int? tammemPercentage;
  double? totalPrice;
  List<int>? contractIds;

  FinancialDataModel(
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

  FinancialDataModel.fromJson( json) {
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
    contractIds = json['contract_ids'].cast<int>();
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
    data['contract_ids'] = this.contractIds;
    return data;
  }
}
