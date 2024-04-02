import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "ratihpuspitasari10145@gmail.com");

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}