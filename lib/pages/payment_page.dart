import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/controllers/payment_controller.dart';
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
            DropdownMenu(
                onSelected: controller.onDropdownSelect,
                hintText: "Payment type",
                width: getProportionateScreenWidth(350),
                dropdownMenuEntries: PaymentMethod.values
                    .map((e) => DropdownMenuEntry(value: e, label: e.label))
                    .toList()),
            Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, count) {
                  return Obx(
                    () => ListTile(
                      leading: Radio(
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
    );
  }
}
