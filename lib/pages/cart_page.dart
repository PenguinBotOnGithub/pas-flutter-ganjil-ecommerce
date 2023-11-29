import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/cart_controller.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
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
      body: Obx(
        () => ListView.builder(
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Price: \$${controller.products[count].product.price}"),
                      Text("Amount: ${controller.products[count].amount}"),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () => controller.onRemoveTap(count),
                      icon: Icon(Icons.delete)),
                )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 0.5, color: mGreyColor))),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: getProportionateScreenHeight(80),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Price",
                  style: mTitleStyle16,
                ),
                Obx(
                  () => Text(
                    "\$${controller.totalPrice}",
                    style: mStylePrice,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: DefaultButtonCustomColor(
              text: "Checkout",
              color: kPrimaryColor,
              press: controller.onCheckoutTap,
            ))
          ],
        ),
      ),
    );
  }
}
