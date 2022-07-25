import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:propertystop/utils/constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/custom_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Dio dio = Dio();

  TextEditingController fullNameInput = TextEditingController();
  TextEditingController emailAddressInput = TextEditingController();
  TextEditingController mobileNumberInput = TextEditingController();
  // TextEditingController locationInput = TextEditingController();

  fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();

    final csrf = prefs.getString("csrf");
    final csrfCookie = prefs.getString("csrfCookie");
    final sessionId = prefs.getString("sessionId");

    FormData formData = FormData.fromMap({
      "device": "Mobile",
    });

    dio.options.headers['X-CSRFToken'] = csrf;
    dio.options.headers['Cookie'] = "$csrfCookie;sessionid=$sessionId";

    try {
      final profileReq = await dio.post(
        'http://propertystop.com/getUserInfo',
        data: formData,
      );
      context.loaderOverlay.hide();
      if (profileReq.statusCode == 200) {
        if (profileReq.data['success'] == "0") {
          await Dialogs.infoDialog(
            profileReq.data['message'],
          );
          return;
        }

        // Login Success
        print(profileReq.data['data']);
        fullNameInput.text = profileReq.data['data']['full_name'];
        emailAddressInput.text = profileReq.data['data']['email'];
        mobileNumberInput.text = profileReq.data['data']['contact_number'];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      context.loaderOverlay.hide();
      Fluttertoast.showToast(
        msg: "Something went wrong!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: fullNameInput,
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: constants.FIELD_COLOR,
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Full Name",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: emailAddressInput,
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: constants.FIELD_COLOR,
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Email Address",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: mobileNumberInput,
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: constants.FIELD_COLOR,
                                contentPadding: const EdgeInsets.all(12),
                                hintText: "Mobile Number",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: TextFormField(
                          //     style: const TextStyle(fontSize: 16),
                          //     keyboardType: TextInputType.number,
                          //     textInputAction: TextInputAction.done,
                          //     inputFormatters: [
                          //       LengthLimitingTextInputFormatter(6),
                          //       FilteringTextInputFormatter.digitsOnly,
                          //     ],
                          //     decoration: InputDecoration(
                          //       border: OutlineInputBorder(
                          //         borderSide: BorderSide.none,
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //       filled: true,
                          //       fillColor: constants.FIELD_COLOR,
                          //       contentPadding: const EdgeInsets.all(12),
                          //       hintText: "Pincode",
                          //       hintStyle: const TextStyle(
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          // height: 25,
                          // ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: constants.PRIMARY_COLOR,
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
