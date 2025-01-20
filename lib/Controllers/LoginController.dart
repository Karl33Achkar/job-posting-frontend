import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Core/Network/DioClient.dart';
import '../Core/Network/showSuccessDialog.dart';
import '../Models/User.dart';
import '../Routes/AppRoute.dart';


class LoginController  extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _load_shared_prefernces();
  }

  void _load_shared_prefernces() async
  {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Get.offNamed(AppRoute.home);
    }
  }


  void login() async {
    User user = User(email: email.value.text, password: password.value.text);
    String requestBody = user.toJson();

    var post = await DioClient().getInstance().post("http://x.x.x.x:8000/api/login", data: requestBody);
    if (post.statusCode == 200) {
      showSuccessDialog(Get.context!, "Success", "User Logged In Successfully", () {
        print(post.data);
        prefs.setString('token', post.data['token'] ?? '');
        prefs.setString('fullName', post.data['full_name'] ?? ''); // Store full name
        prefs.setString('email', post.data['email'] ?? ''); // Store email
        Get.toNamed(AppRoute.home);
      });
    }
  }

  }


