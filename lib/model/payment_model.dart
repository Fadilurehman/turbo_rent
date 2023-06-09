// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    String? id;
    String? object;
    int? amount;
    AmountDetails? amountDetails;
    dynamic automaticPaymentMethods;
    dynamic canceledAt;
    dynamic cancellationReason;
    String? captureMethod;
    String? clientSecret;
    String? confirmationMethod;
    int? created;
    String? currency;
    dynamic description;
    dynamic lastPaymentError;
    bool? livemode;
    NextAction? nextAction;
    PaymentMethod? paymentMethod;
    List<String>? paymentMethodTypes;
    dynamic processing;
    String? receiptEmail;
    dynamic setupFutureUsage;
    dynamic shipping;
    dynamic source;
    String? status;

    PaymentModel({
        this.id,
        this.object,
        this.amount,
        this.amountDetails,
        this.automaticPaymentMethods,
        this.canceledAt,
        this.cancellationReason,
        this.captureMethod,
        this.clientSecret,
        this.confirmationMethod,
        this.created,
        this.currency,
        this.description,
        this.lastPaymentError,
        this.livemode,
        this.nextAction,
        this.paymentMethod,
        this.paymentMethodTypes,
        this.processing,
        this.receiptEmail,
        this.setupFutureUsage,
        this.shipping,
        this.source,
        this.status,
    });

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["id"],
        object: json["object"],
        amount: json["amount"],
        amountDetails: json["amount_details"] == null ? null : AmountDetails.fromJson(json["amount_details"]),
        automaticPaymentMethods: json["automatic_payment_methods"],
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"],
        clientSecret: json["client_secret"],
        confirmationMethod: json["confirmation_method"],
        created: json["created"],
        currency: json["currency"],
        description: json["description"],
        lastPaymentError: json["last_payment_error"],
        livemode: json["livemode"],
        nextAction: json["next_action"] == null ? null : NextAction.fromJson(json["next_action"]),
        paymentMethod: json["payment_method"] == null ? null : PaymentMethod.fromJson(json["payment_method"]),
        paymentMethodTypes: json["payment_method_types"] == null ? [] : List<String>.from(json["payment_method_types"]!.map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "amount": amount,
        "amount_details": amountDetails?.toJson(),
        "automatic_payment_methods": automaticPaymentMethods,
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod,
        "client_secret": clientSecret,
        "confirmation_method": confirmationMethod,
        "created": created,
        "currency": currency,
        "description": description,
        "last_payment_error": lastPaymentError,
        "livemode": livemode,
        "next_action": nextAction?.toJson(),
        "payment_method": paymentMethod?.toJson(),
        "payment_method_types": paymentMethodTypes == null ? [] : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "status": status,
    };
}

class AmountDetails {
    Tip? tip;

    AmountDetails({
        this.tip,
    });

    factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json["tip"] == null ? null : Tip.fromJson(json["tip"]),
    );

    Map<String, dynamic> toJson() => {
        "tip": tip?.toJson(),
    };
}

class Tip {
    Tip();

    factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    );

    Map<String, dynamic> toJson() => {
    };
}

class NextAction {
    String? type;
    UseStripeSdk? useStripeSdk;

    NextAction({
        this.type,
        this.useStripeSdk,
    });

    factory NextAction.fromJson(Map<String, dynamic> json) => NextAction(
        type: json["type"],
        useStripeSdk: json["use_stripe_sdk"] == null ? null : UseStripeSdk.fromJson(json["use_stripe_sdk"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "use_stripe_sdk": useStripeSdk?.toJson(),
    };
}

class UseStripeSdk {
    String? type;
    String? stripeJs;
    String? source;

    UseStripeSdk({
        this.type,
        this.stripeJs,
        this.source,
    });

    factory UseStripeSdk.fromJson(Map<String, dynamic> json) => UseStripeSdk(
        type: json["type"],
        stripeJs: json["stripe_js"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "stripe_js": stripeJs,
        "source": source,
    };
}

class PaymentMethod {
    String? id;
    String? object;
    BillingDetailData? billingDetails;
    Card? card;
    int? created;
    dynamic customer;
    bool? livemode;
    String? type;

    PaymentMethod({
        this.id,
        this.object,
        this.billingDetails,
        this.card,
        this.created,
        this.customer,
        this.livemode,
        this.type,
    });

    factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        object: json["object"],
        billingDetails: json["billing_details"] == null ? null : BillingDetailData.fromJson(json["billing_details"]),
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
        created: json["created"],
        customer: json["customer"],
        livemode: json["livemode"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "billing_details": billingDetails?.toJson(),
        "card": card?.toJson(),
        "created": created,
        "customer": customer,
        "livemode": livemode,
        "type": type,
    };
}

class BillingDetailData {
    AddressData? address;
    dynamic email;
    dynamic name;
    dynamic phone;

    BillingDetailData({
        this.address,
        this.email,
        this.name,
        this.phone,
    });

    factory BillingDetailData.fromJson(Map<String, dynamic> json) => BillingDetailData(
        address: json["address"] == null ? null : AddressData.fromJson(json["address"]),
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "email": email,
        "name": name,
        "phone": phone,
    };
}

class AddressData {
    dynamic city;
    String? country;
    dynamic line1;
    dynamic line2;
    dynamic postalCode;
    dynamic state;

    AddressData({
        this.city,
        this.country,
        this.line1,
        this.line2,
        this.postalCode,
        this.state,
    });

    factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        city: json["city"],
        country: json["country"],
        line1: json["line1"],
        line2: json["line2"],
        postalCode: json["postal_code"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "line1": line1,
        "line2": line2,
        "postal_code": postalCode,
        "state": state,
    };
}

class Card {
    String? brand;
    Checks? checks;
    String? country;
    int? expMonth;
    int? expYear;
    String? funding;
    dynamic generatedFrom;
    String? last4;
    Networks? networks;
    ThreeDSecureUsage? threeDSecureUsage;
    dynamic wallet;

    Card({
        this.brand,
        this.checks,
        this.country,
        this.expMonth,
        this.expYear,
        this.funding,
        this.generatedFrom,
        this.last4,
        this.networks,
        this.threeDSecureUsage,
        this.wallet,
    });

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        brand: json["brand"],
        checks: json["checks"] == null ? null : Checks.fromJson(json["checks"]),
        country: json["country"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        funding: json["funding"],
        generatedFrom: json["generated_from"],
        last4: json["last4"],
        networks: json["networks"] == null ? null : Networks.fromJson(json["networks"]),
        threeDSecureUsage: json["three_d_secure_usage"] == null ? null : ThreeDSecureUsage.fromJson(json["three_d_secure_usage"]),
        wallet: json["wallet"],
    );

    Map<String, dynamic> toJson() => {
        "brand": brand,
        "checks": checks?.toJson(),
        "country": country,
        "exp_month": expMonth,
        "exp_year": expYear,
        "funding": funding,
        "generated_from": generatedFrom,
        "last4": last4,
        "networks": networks?.toJson(),
        "three_d_secure_usage": threeDSecureUsage?.toJson(),
        "wallet": wallet,
    };
}

class Checks {
    dynamic addressLine1Check;
    dynamic addressPostalCodeCheck;
    dynamic cvcCheck;

    Checks({
        this.addressLine1Check,
        this.addressPostalCodeCheck,
        this.cvcCheck,
    });

    factory Checks.fromJson(Map<String, dynamic> json) => Checks(
        addressLine1Check: json["address_line1_check"],
        addressPostalCodeCheck: json["address_postal_code_check"],
        cvcCheck: json["cvc_check"],
    );

    Map<String, dynamic> toJson() => {
        "address_line1_check": addressLine1Check,
        "address_postal_code_check": addressPostalCodeCheck,
        "cvc_check": cvcCheck,
    };
}

class Networks {
    List<String>? available;
    dynamic preferred;

    Networks({
        this.available,
        this.preferred,
    });

    factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        available: json["available"] == null ? [] : List<String>.from(json["available"]!.map((x) => x)),
        preferred: json["preferred"],
    );

    Map<String, dynamic> toJson() => {
        "available": available == null ? [] : List<dynamic>.from(available!.map((x) => x)),
        "preferred": preferred,
    };
}

class ThreeDSecureUsage {
    bool? supported;

    ThreeDSecureUsage({
        this.supported,
    });

    factory ThreeDSecureUsage.fromJson(Map<String, dynamic> json) => ThreeDSecureUsage(
        supported: json["supported"],
    );

    Map<String, dynamic> toJson() => {
        "supported": supported,
    };
}
