class ApiErrorResponse {
  String? exCode;
  String? message;
  String? type;

  ApiErrorResponse({this.exCode, this.message, this.type});

  ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    exCode = json['exCode'].toString();
    message = json['message'].toString();
    type = json['type'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exCode'] = this.exCode;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
