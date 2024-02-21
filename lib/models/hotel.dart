class Hotel {
  final int id;
  final String name;
  final String detail;
  final String location;
  final int price;
  final String image;
  final List<String> amenities;

  Hotel({
    required this.id,
    required this.name,
    required this.detail,
    required this.location,
    required this.price,
    required this.image,
    required this.amenities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      location: json['location'],
      price: json['price'],
      image: json['image'],
      amenities: List<String>.from(json['amenities']),
    );
  }
}
