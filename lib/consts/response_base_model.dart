
class ResponseBaseModel {
  dynamic status;
  dynamic message;
  dynamic statusCode;

  ResponseBaseModel({this.status, this.message, this.statusCode});

  ResponseBaseModel.fromJson(json) {
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}
