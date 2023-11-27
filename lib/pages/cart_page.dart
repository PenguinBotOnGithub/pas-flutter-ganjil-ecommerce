import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: controller.products.length,
            shrinkWrap: true,
            itemBuilder: (context, count) => ListTile(
                  leading: Image.network(
                      controller.products[count].product.thumbnail),
                  title: Text(controller.products[count].product.title),
                  subtitle:
                      Text("Amount: ${controller.products[count].amount}"),
                )),
      ),
    );
  }
}
