import 'package:checkout_payment_ui/core/widgets/app_elevated_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/bottom_sheet_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'order_info_item.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/basket_image.png',
              height: 450,
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: const OrderInfoItem(
              title: 'Order Subtotal',
              subtitle: '42.97\$',
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: const OrderInfoItem(title: 'Discount', subtitle: '0\$'),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: const OrderInfoItem(title: 'Shipping', subtitle: '8\$'),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: const Divider(
              thickness: 3,
              endIndent: 8,
              indent: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: OrderInfoItem(
              title: 'Total',
              subtitle: r'50.97$',
              titleStyle: Styles.font24BlackW500,
              subTitleStyle: Styles.font24BlackW500,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: AppElevatedButton(
                  label: 'Complete Payment',
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18),
                    ),
                    builder: (context) {
                      return BottomSheetBody();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}