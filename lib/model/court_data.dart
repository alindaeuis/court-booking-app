class CourtData {
  String id;
  String? image;
  String? name;
  String? place;
  String? facility;
  String? description;
  String? openTime;
  String? openDays;
  String? rating;
  String? price;
  String? duration;

  CourtData({
    required this.id,
    this.image,
    this.name,
    this.place,
    this.facility,
    this.description,
    this.openTime,
    this.openDays,
    this.rating,
    this.price,
    this.duration,
  });
}

var courtList = [
    CourtData(
      id: "1",
      image: "assets/images/lapangan_1.png",
      name: "Futsal Court A",
      place: "Indoor",
      facility: "Air Conditioned",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      rating: "4.8",
      price: "50000",
      duration: "/hour",
      openTime: "08:00 - 20:00",
      openDays: "Senin - Minggu",
    ),
    CourtData(
      id: "2",
      image: "assets/images/lapangan_2.png",
      name: "Basketball Court B",
      place: "Outdoor",
      facility: "Premium Floor",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      rating: "4.7",
      price: "75000",
      duration: "/hour",
      openTime: "08:00 - 20:00",
      openDays: "Senin - Minggu",
    ),
    CourtData(
      id: "3",
      image: "assets/images/lapangan_3.png",
      name: "Badminton Court C",
      place: "Indoor",
      facility: "Wooden Floor",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      rating: "4.9",
      price: "45000",
      duration: "/hour",
      openTime: "08:00 - 20:00",
      openDays: "Senin - Minggu",
    ),
    CourtData(
      id: "4",
      image: "assets/images/lapangan_4.png",
      name: "Tennis Court D",
      place: "Outdoor",
      facility: "Hard Surface",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      rating: "4.6",
      price: "80000",
      duration: "/hour",
      openTime: "08:00 - 20:00",
      openDays: "Senin - Minggu",
    ),
    CourtData(
      id: "5",
      image: "assets/images/lapangan_5.png",
      name: "Volleyball Court E",
      place: "Indoor",
      facility: "Synthetic Floor",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
      rating: "4.5",
      price: "60000",
      duration: "/hour",
      openTime: "08:00 - 20:00",
      openDays: "Senin - Minggu",
    )
  ];
