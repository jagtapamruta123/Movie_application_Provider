class ResponseModel<Model> {
  Model? data;
  bool? isSuccess;
  String? message;
  int? statusCode;

  ResponseModel({this.data, this.isSuccess, this.message, this.statusCode});
}
