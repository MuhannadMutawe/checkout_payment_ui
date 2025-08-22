import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/checkout_repo_implement.dart';
import '../../manger/payment_cubit.dart';
import 'custom_button_bloc_consumer.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaymentCubit(CheckoutRepoImplement()),
      child: SafeArea(
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
              CustomButtonBlocConsumer(
                methodIndex: currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
