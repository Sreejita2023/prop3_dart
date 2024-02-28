

class DeliveryData {
//   prop initialize
  bool enableSelfDelivery;
  bool partnerDelivery;
  int maxOrder;
  num baseRadius;
  num baseCharge;
  num maxRadius;
  num chargePerKm;


   // constructor
  DeliveryData(
      {required this.enableSelfDelivery,
      required this.partnerDelivery,
      required this.baseRadius,
      required this.baseCharge,
      required this.maxRadius,
      required this.chargePerKm,
      required this.maxOrder});

  // todo from json

//   todo to json
}
