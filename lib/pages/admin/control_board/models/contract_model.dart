class ContractModel {
  int? id;
  int? financialId;
  int? realStateId;
  dynamic? contractPaymentsId;
  int? ownerId;
  dynamic? ownerRepresenterId;
  int? renterId;
  dynamic? renterRepresenterId;
  String? startDate;
  String? endDate;
  String? contractNumber;
  String? ownerName;
  String? ownerRepresenterName;
  String? renterName;
  String? renterRepresenterName;
//  String? owner_name;
//   String? owner_representer_name;
//   String? renter_name;
//   String? renter_representer_name;

  ContractModel(
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
        this.contractNumber,
        this.ownerName,
        this.ownerRepresenterName,
        this.renterName,
        this.renterRepresenterName,

      });

  ContractModel.fromJson(Map<String, dynamic> json) {
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
    ownerName = json['owner_name'];
    ownerRepresenterName = json['owner_representer_name'];
    renterName = json['renter_name'];
    renterRepresenterName = json['renter_representer_name'];
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

    data['owner_name'] = this.ownerName;
    data['owner_representer_name'] = this.ownerRepresenterName;
    data['renter_name'] = this.renterName;
    data['renter_representer_name'] = this.renterRepresenterName;

    return data;
  }
  @override
  String toString() {
    return contractNumber ?? "";
  }
}
