import 'package:checkout_payment_ui/core/widgets/app_elevated_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/payment_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'order_info_item.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      child: Column(
        children: [
          Image.asset('assets/images/basket_image.png'),
          const SizedBox(
            height: 30,
          ),
          const OrderInfoItem(title: 'Order Subtotal', subtitle: '42.97\$'),
          const SizedBox(
            height: 5,
          ),
          const OrderInfoItem(title: 'Discount', subtitle: '0\$'),
          const SizedBox(
            height: 5,
          ),
          const OrderInfoItem(title: 'Shipping', subtitle: '8\$'),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            thickness: 3,
            endIndent: 8,
            indent: 8,
          ),
          const SizedBox(
            height: 15,
          ),
          OrderInfoItem(
            title: 'Total',
            subtitle: r'50.97$',
            titleStyle: Styles.font24BlackW500,
            subTitleStyle: Styles.font24BlackW500,
          ),
          const SizedBox(
            height: 25,
          ),
          AppElevatedButton(
            label: 'Complete Payment',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetailsView(),)),
          ),
        ],
      ),
    );
  }
}
