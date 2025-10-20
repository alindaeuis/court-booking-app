class DurationList {
  String id;
  String? duration;
  String? description;
  String? price;
  String? serviceFee;

  DurationList({
    required this.id,
    this.duration,
    this.description,
    this.price,
    this.serviceFee
  });
}

var duration = [
  DurationList(
    id: "1",
    duration: "1 Hour",
    description: "Perfect for training",
    price: "50000",
    serviceFee: "5000",

  ),
  DurationList(
    id: "2",
    duration: "2 Hour",
    description: "Best value for groups",
    price: "100000",
    serviceFee: "5000",
  ),
  DurationList(
    id: "3",
    duration: "3 Hour",
    description: "Great for tournaments",
    price: "150000",
    serviceFee: "5000",
  )
];