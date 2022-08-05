// To parse this JSON data, do
//
//     final registerUserRequest = registerUserRequestFromJson(jsonString);

import 'dart:convert';

RegisterUserRequest registerUserRequestFromJson(String str) =>
    RegisterUserRequest.fromJson(json.decode(str));

String registerUserRequestToJson(RegisterUserRequest data) =>
    json.encode(data.toJson());

class RegisterUserRequest {
  RegisterUserRequest({
    required this.btnRegister,
    required this.field,
    required this.fullName,
    required this.contactNumber,
    required this.email,
    required this.userPassword,
    required this.userType,
  });

  String btnRegister;
  String field;
  String fullName;
  String contactNumber;
  String email;
  String userPassword;
  String userType;

  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      RegisterUserRequest(
        btnRegister: json["btn_register"],
        field: json["field"],
        fullName: json["full_name"],
        contactNumber: json["contact_number"],
        email: json["email"],
        userPassword: json["user_password"],
        userType: json["user_type"],
      );

  Map<String, String> toJson() => {
        "btn_register": btnRegister,
        "field": field,
        "full_name": fullName,
        "contact_number": contactNumber,
        "email": email,
        "user_password": userPassword,
        "user_type": userType,
      };
}
