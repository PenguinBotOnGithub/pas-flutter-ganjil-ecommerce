import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/payment_controller.dart';
import 'package:flutter_tugas_pas/widgets/components/default_button_custom_color.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';
import 'package:flutter_tugas_pas/widgets/size_config.dart';
import 'package:get/get.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mGreyColor),
        title: Text(
          "Choose a payment method",
          style: TextStyle(color: mTitleColor),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            DropdownMenu(
                onSelected: controller.onDropdownSelect,
                hintText: "Payment type",
                width: getProportionateScreenWidth(350),
                dropdownMenuEntries: PaymentMethod.values
                    .map((e) => DropdownMenuEntry(value: e, label: e.label))
                    .toList()),
            SizedBox(
              height: 20,
            ),
            Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, count) {
                  return Obx(
                    () => ListTile(
                      onTap: () => controller.onMethodRadioSelect(
                          controller.paymentMethods[count]),
                      leading: Radio(
                        activeColor: kPrimaryColor,
                        value: controller.paymentMethods[count],
                        groupValue: controller.selectedMethod.value,
                        onChanged: controller.onMethodRadioSelect,
                      ),
                      title: Text(controller.paymentMethods[count].label),
                    ),
                  );
                }))
          ],
        ),
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
