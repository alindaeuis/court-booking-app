class PaymentMethod {
  String id;
  String? paymentMethod;
  String? paymentCategory;
  String? description;

  PaymentMethod({
    required this.id,
    this.paymentMethod,
    this.paymentCategory,
    this.description,
  });
}

var paymentList = [
  PaymentMethod(
    id: "1",
    paymentMethod: "Pay on Location",
    paymentCategory: "Cash Payment",
    description: "Pay with cash when you arrive at the location",
  ),
  PaymentMethod(
    id: "2",
    paymentMethod: "Pay via QRIS",
    paymentCategory: "QRIS Payment",
    description: "Scan QR code to pay instantly with your e- wallet",
  ),
];