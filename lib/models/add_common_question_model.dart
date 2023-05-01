import 'common_question_model.dart';

class AddCommonQuestion {
  Data? data;
  String? message;
  int? status;

  AddCommonQuestion({this.data, this.message, this.status});

  AddCommonQuestion.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}