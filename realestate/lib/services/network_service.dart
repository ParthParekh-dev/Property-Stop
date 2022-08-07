import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:propertystop/models/request/register_user_request.dart';
import 'package:propertystop/models/response/property_detail_response.dart';
import 'package:propertystop/models/response/propery_list_response.dart';
import 'package:propertystop/utils/constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  Future<PropertyListResponse?> getPropertyList() async {
    var url = Uri.parse('${constants.baseUrl}/paginate-data');

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({'page': '1'});

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("getPropertyList\n" + response.statusCode.toString());
    debugPrint("getPropertyList\n" + response.body);

    if (response.statusCode == 200) {
      return (propertyListResponseFromJson(response.body));
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #1 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<PropertyDetailResponse?> getPropertyDetail(String propertyId) async {
    var url = Uri.parse(
        '${constants.baseUrl}/property-details?id=$propertyId&device=Mobile');

    http.Response response = await http
        .get(
          url,
        )
        .timeout(const Duration(seconds: 20));

    debugPrint(url.toString());
    debugPrint("getPropertyDetail\n" + response.statusCode.toString());
    debugPrint("getPropertyDetail\n" + response.body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return propertyDetailResponseFromJson(jsonString);
    } else {
      //show error
      Get.snackbar('Something went wrong,Please try again later',
          'Error #2 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> registerUser(RegisterUserRequest registerUserRequest) async {
    var url = Uri.parse('${constants.baseUrl}/register-user');

    var request = http.MultipartRequest('POST', url);

    request.fields.addAll(registerUserRequest.toJson());

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("registerUser\n" + response.statusCode.toString());
    debugPrint("registerUser\n" + response.body);

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #3 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> verifyOtp(String otp, String mobileNumber) async {
    var url = Uri.parse('${constants.baseUrl}/verify-otp');

    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'btn_otp': 'btn_otp',
      'field_otp': '',
      'otp_code': otp,
      'device': 'Mobile',
      'mobile_number': mobileNumber
    });

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("verifOtp\n" + response.statusCode.toString());
    debugPrint("verifOtp\n" + response.body);

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #3 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> resendOtp() async {
    var url = Uri.parse('${constants.baseUrl}/resend-otp');

    var request = http.MultipartRequest('POST', url);

    final prefs = await SharedPreferences.getInstance();
    String? mobile = prefs.getString(constants.mobileNumber);

    request.fields.addAll({
      'resend_otp': 'resend_otp',
      'device': 'Mobile',
      'mobile_number': mobile.toString()
    });

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("resendOtp\n" + response.statusCode.toString());
    debugPrint("resendOtp\n" + response.body);

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #4 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> loginUser(String mobile, String password) async {
    var url = Uri.parse('${constants.baseUrl}/login-user');

    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'btn_login': 'btn_login',
      'field_log': '',
      'contact_number': mobile,
      'user_password': password,
      'device': 'Mobile'
    });

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("loginUser\n" + response.statusCode.toString());
    debugPrint("loginUser\n" + response.body);

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #5 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  Future<String?> changePassword() async {
    var url = Uri.parse('${constants.baseUrl}/changeUserPass');

    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'btn_changeUserPass': 'btn_changeUserPass',
      'contact_number': '8082019432',
      'emp_pass': 'shalini'
    });

    var streamedResponse =
        await request.send().timeout(const Duration(seconds: 20));

    var response = await http.Response.fromStream(streamedResponse);

    debugPrint(url.toString());
    debugPrint("changePassword\n" + response.statusCode.toString());
    debugPrint("changePassword\n" + response.body);

    if (response.statusCode == 200) {
      return (response.body);
    } else {
      Get.snackbar('Something went wrong,Please try again later',
          'Error #6 ${response.statusCode}',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }
}
