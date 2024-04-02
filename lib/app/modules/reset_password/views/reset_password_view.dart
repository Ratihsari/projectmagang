import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/controllers/auth_controller.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password Secreen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => authC.resetpassword(
                controller.emailC.text,
              ),
              child: Text("RESET"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun ?"),
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
