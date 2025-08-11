import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_elevated_button.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  int _index = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PaymentMethodItems(
              currentIndex: _index,
              onChangeIndex: (value) {
                setState(() {
                  _index = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 25,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autoValidateMode: autoValidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 18,
                ),
                child: AppElevatedButton(
                  label: 'Payment',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ThankYouView(),
                        ),
                      );
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
