class ContractRequest {
  String? startDate;
  String? endDate;
  int? ownerId;
  int? renterId;
  int? ownerRepresenterId;
  int? renterRepresenterId;
  int? realStateId;
  int? financialId;
  // String? type;
  // double? area;
  String? contractNumber;

  ContractRequest(
      {this.startDate,
      this.endDate,
      this.ownerId,
      this.renterId,
      this.ownerRepresenterId,
      this.renterRepresenterId,
      this.realStateId,
      this.financialId,
        // this.area,
        // this.type,
      this.contractNumber});

  ContractRequest.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    ownerId = json['owner_id'];
    renterId = json['renter_id'];
    // area = json['area'];
    // type = json['type'];
    ownerRepresenterId = json['owner_representer_id'];
    renterRepresenterId = json['renter_representer_id'];
    realStateId = json['real_state_id'];
    financialId = json['financial_id'];
    contractNumber = json['contract_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['owner_id'] = this.ownerId;
    data['renter_id'] = this.renterId;
    data['owner_representer_id'] = this.ownerRepresenterId;
    data['renter_representer_id'] = this.renterRepresenterId;
    data['real_state_id'] = this.realStateId;
    data['financial_id'] = this.financialId;
    data['contract_number'] = this.contractNumber;
    // data['type'] = this.type;
    // data['area'] = this.area;

    return data;
  }
}
