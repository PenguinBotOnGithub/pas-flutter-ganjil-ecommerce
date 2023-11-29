import 'package:get/get.dart';

abstract class LabeledEnum {
  const LabeledEnum(this.label);
  final String label;
}

enum PaymentMethod implements LabeledEnum {
  ewallet("E-Wallet"),
  card("Credit/Debit Cards"),
  physical("Cash");

  const PaymentMethod(this.label);
  final String label;
}

enum CashMethod implements LabeledEnum {
  indomaret("Indomaret"),
  alfamart("Alfamart");

  const CashMethod(this.label);
  final String label;
}

enum CardMethod implements LabeledEnum {
  bni("BNI"),
  bsi("BSI"),
  mandiri("Mandiri"),
  bri("BRI"),
  permata("Bank Permata");

  const CardMethod(this.label);
  final String label;
}

enum EwalletMethod implements LabeledEnum {
  gopay("GoPay"),
  ovo("OVO"),
  shopee("ShopeePay"),
  linkaja("LinkAja");

  const EwalletMethod(this.label);
  final String label;
}

class PaymentController extends GetxController {
  late Rxn<PaymentMethod> methodType = Rxn();
  RxList<LabeledEnum> paymentMethods = <LabeledEnum>[].obs;
  Rxn<LabeledEnum> selectedMethod = Rxn();
  RxInt totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    totalPrice.value = Get.arguments as int;
  }

  void onDropdownSelect(PaymentMethod? val) {
    if (val == null) return;

    methodType.value = val;
    selectedMethod.value = null;
    switch (val) {
      case PaymentMethod.ewallet:
        {
          paymentMethods.clear();
          paymentMethods.addAll(EwalletMethod.values.map((e) => e).toList());
        }
      case PaymentMethod.card:
        {
          paymentMethods.clear();
          paymentMethods.addAll(CardMethod.values.map((e) => e).toList());
        }
      case PaymentMethod.physical:
        {
          paymentMethods.clear();
          paymentMethods.addAll(CashMethod.values.map((e) => e).toList());
        }
    }
    ;
  }

  void onMethodRadioSelect(LabeledEnum? val) {
    if (val == null) return;

    selectedMethod.value = val;
  }

  void onCheckoutTap() {
    Get.offNamed("/payment/process");
  }
}
