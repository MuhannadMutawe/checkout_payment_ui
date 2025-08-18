import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/manger/payment_cubit.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_elevated_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return AppElevatedButton(
          isLoading: state is PaymentLoading ? true : false,
          label: 'Continue',
          onPressed: () {
            BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIntentInputModel: PaymentIntentInputModel(
                amount: '100',
                currency: 'USD',
                customerId: 'cus_StJwtrnpqUlpdb'
              ),
            );
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
}
