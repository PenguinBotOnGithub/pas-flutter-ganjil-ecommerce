import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/cart_controller.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mGreyColor),
        title: Text(
          "Cart",
          style: TextStyle(color: mTitleColor),
        ),
      ),
      body: ListView.builder(
          itemCount: controller.products.length,
          shrinkWrap: true,
          itemBuilder: (context, count) => ListTile(
                leading: SizedBox(
                    width: getProportionateScreenWidth(80),
                    child: Image.network(
                      controller.products[count].product.thumbnail,
                      fit: BoxFit.cover,
                    )),
                title: Text(controller.products[count].product.title),
                subtitle: Text("Amount: ${controller.products[count].amount}"),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              )),
    );
  }
}
