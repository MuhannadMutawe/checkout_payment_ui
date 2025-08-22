import 'package:checkout_payment_ui/core/errors/failure.dart';
import 'package:checkout_payment_ui/core/utils/stripe_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImplement extends CheckoutRepo{
  final StripeService _stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async{
    try{
      await _stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(massage: e.error.message ?? 'Oops there was an error'));
    }
    on Exception catch(e){
      return left(ServerFailure(massage: e.toString()));
    }
  }

}