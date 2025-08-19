import 'package:checkout_payment_ui/core/utils/api_keys.dart';
import 'package:checkout_payment_ui/core/utils/api_service.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment_ui/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService _apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel,) async {
    var response = await _apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await _apiService.post(
      body: {'customer': customerId},
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2025-07-30.basil'
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
    );
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Muhannad',
        customerId: initPaymentSheetInputModel.customerId,
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
        initPaymentSheetInputModel.ephemeralKeySecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }
}
