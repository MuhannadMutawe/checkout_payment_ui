import 'dart:developer';

import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/manger/payment_cubit.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/my_card_view.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../../core/functions/get_transctions.dart';
import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/widgets/app_elevated_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.methodIndex});

  final int methodIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return AppElevatedButton(
          isLoading: state is PaymentLoading ? true : false,
          label: 'Continue',
          onPressed: () {
            if (methodIndex == 0) {
              excuteStripePayment(context);
            } else {
              exceutePaypalPayment(context, getTransctionsData() );
            }
          },
        );
      },
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThankYouView()),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMassage)));
        }
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: '100',
        currency: 'USD',
        customerId: 'cus_StJwtrnpqUlpdb',
      ),
    );
  }

  void exceutePaypalPayment(BuildContext context,
      var transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            }),
                (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyCardView();
            }),
                (route) {
              return false;
            },
          );
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
