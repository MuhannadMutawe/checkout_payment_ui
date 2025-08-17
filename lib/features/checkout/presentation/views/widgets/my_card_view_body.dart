import 'package:checkout_payment_ui/core/widgets/app_elevated_button.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/repos/checkout_repo_implement.dart';
import '../../manger/payment_cubit.dart';
import 'order_info_item.dart';

class MyCardViewBody extends StatefulWidget {
  const MyCardViewBody({super.key});

  @override
  State<MyCardViewBody> createState() => _MyCardViewBodyState();
}

class _MyCardViewBodyState extends State<MyCardViewBody> {
  int currentIndex = 0;

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
                      return BlocProvider(
                        create: (context) =>
                            PaymentCubit(CheckoutRepoImplement()),
                        child: StatefulBuilder(
                          builder: (context, setState) => SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PaymentMethodItems(
                                    currentIndex: currentIndex,
                                    onChangeIndex: (value) {
                                      setState(() {
                                        currentIndex = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomButtonBlocConsumer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
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
