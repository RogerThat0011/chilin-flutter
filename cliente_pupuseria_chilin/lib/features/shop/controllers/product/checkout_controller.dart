import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/payment_method_model.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Efectivo', image: TImages.dolarIcon);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TSectionHeading(title: 'Selecciona el Metodo de Pago', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwSections),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Efectivo', image: TImages.dolarIcon)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: TImages.paypal)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: TImages.googlePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: TImages.applePay)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: TImages.visa)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: TImages.masterCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: TImages.paystack)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Tarjeta de Credito', image: TImages.creditCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                PaymentTile(paymentMethod: PaymentMethodModel(name: 'Tarjeta de Debito', image: TImages.creditCard)),
                const SizedBox(height: TSizes.spaceBtwItems/2),
              ],
            ),
          ),
        )
    );
  }
}
