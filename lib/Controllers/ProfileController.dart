import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Core/Network/DioClient.dart';
import '../Core/Network/showSuccessDialog.dart';
import '../Models/User.dart';
import '../Routes/AppRoute.dart';



class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void change() async {
    User user = User(
      name: name.value.text,
      email: email.value.text,
      password: password.value.text,
    );

    try {
      var post = await DioClient().getInstance().post(
        "http://x.x.x.x:8000/api/register",
        data: user.toJson(),
      );

      print(post.data); // Debug API response

      if (post.statusCode == 200) {
        String message = post.data['message'] ?? '';
        if (message.contains('User Created Successfully')) {
          showSuccessDialog(Get.context!, "Success", "User Changed Successfully, Please Log in Again", () {
            Get.offAllNamed(AppRoute.login);
          });
        }
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }
}


