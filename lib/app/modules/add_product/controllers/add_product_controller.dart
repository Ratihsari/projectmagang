import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addproduct(String name, String price) async {
    CollectionReference products = firestore.collection("products");

    try {
      String dateNow = DateTime.now().toIso8601String();
      await products.add({
        "name": name,
        "price": price,
        "time": dateNow,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan produk",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back(); // close dialog
          Get.back(); // back to home
        },
        textConfirm: "OKAY",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: " Tidak berhasil menambahkan produk",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
