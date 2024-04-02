import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PRODUCT'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          TextField(
            controller: controller.nameC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "product Name",
              ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller.priceC,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "Price",
              ),
          ),
           SizedBox(height: 30),
           ElevatedButton(
            onPressed: ()=> controller.addproduct(
              controller.nameC.text, 
              controller.priceC.text
            ), 
            child: Text("ADD PRODUCT"),
            ),
        ],
        ),
      ),
    );
  }
}
