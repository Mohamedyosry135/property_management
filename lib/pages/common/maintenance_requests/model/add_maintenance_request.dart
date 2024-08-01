class AddMaintenanceRequest {
  int? id;
  String? details;
  String? status;
  int? userId;
  int? realStateId;
  String? name;
  String? phone;
  String? realstateName;
  String? realstateType;
  String? realstateUsageType;
  int? realstateArea;
  bool? realstateDistrict;
  String? realstateCity;
  String? renterName;
  String? renterPhone;
  String? renterEmail;
  String? renterRepresenterName;
  String? renterRepresenterPhone;
  String? renterRepresenterEmail;

  AddMaintenanceRequest(
      {this.id,
        this.details,
        this.status,
        this.userId,
        this.realStateId,
        this.name,
        this.phone,
        this.realstateName,
        this.realstateType,
        this.realstateUsageType,
        this.realstateArea,
        this.realstateDistrict,
        this.realstateCity,
        this.renterName,
        this.renterPhone,
        this.renterEmail,
        this.renterRepresenterName,
        this.renterRepresenterPhone,
        this.renterRepresenterEmail});

  AddMaintenanceRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    status = json['status'];
    userId = json['user_id'];
    realStateId = json['real_state_id'];
    name = json['name'];
    phone = json['phone'];
    realstateName = json['realstate_name'];
    realstateType = json['realstate_type'];
    realstateUsageType = json['realstate_usage_type'];
    realstateArea = json['realstate_area'];
    realstateDistrict = json['realstate_district'];
    realstateCity = json['realstate_city'];
    renterName = json['renter_name'];
    renterPhone = json['renter_phone'];
    renterEmail = json['renter_email'];
    renterRepresenterName = json['renter_representer_name'];
    renterRepresenterPhone = json['renter_representer_phone'];
    renterRepresenterEmail = json['renter_representer_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['real_state_id'] = this.realStateId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['realstate_name'] = this.realstateName;
    data['realstate_type'] = this.realstateType;
    data['realstate_usage_type'] = this.realstateUsageType;
    data['realstate_area'] = this.realstateArea;
    data['realstate_district'] = this.realstateDistrict;
    data['realstate_city'] = this.realstateCity;
    data['renter_name'] = this.renterName;
    data['renter_phone'] = this.renterPhone;
    data['renter_email'] = this.renterEmail;
    data['renter_representer_name'] = this.renterRepresenterName;
    data['renter_representer_phone'] = this.renterRepresenterPhone;
    data['renter_representer_email'] = this.renterRepresenterEmail;
    return data;
  }
}
