import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "ratihpuspitasari10145@gmail.com");
  TextEditingController passC = TextEditingController(text: "123123");

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}

  //TODO: Implement LoginController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

