import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/app/routes/app_pages.dart';
import 'package:flutter_application_2/main.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = main_auth;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  get currentUser => null;

  void resetpassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: "Berhasil",
            middleText:
                "Kami telah mengirimkan reset password ke email $email.",
            onConfirm: () {
              Get.back(); //close dialog
              Get.back(); //go to login
            },
            textConfirm: "Ya, Aku mengerti.");
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid.",
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verification Email",
          middleText: "Kamu perlu verifikasi email terlebih dahulu",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Terjadi salahan",
          middleText: 'Wrong password provided for that user.',
        );
      } else {
        print('Error occurred: $e');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'Tidak dapat login dengan akun ini.',
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: 'Tidak dapat login dengan akun ini.',
      );
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await myUser.user!.sendEmailVerification();

      Get.offNamed('/verifikasi');
      // Get.defaultDialog(
      //   title: "Verification Email",
      //   middleText: "Kami telah mengirimkan email verifikasi ke $email.",
      //   onConfirm: () {
      //     Get.back(); //close dialog
      //     Get.back(); // go to login
      //   },
      //   textConfirm: "Ya, Saya akan cek email.",
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: 'The account already exists for that email.',
        );
      } else {
        Get.defaultDialog(
          title: "Terjadi salah",
          middleText: 'Tidak dapat mendaftarkan akun ini.',
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: 'Tidak dapat mendaftarkan akun ini.',
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void verifikasi(String email, String password) {}
}
