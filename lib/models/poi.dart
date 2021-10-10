class POI {
  final String name;
  final String location;
  final String rating;
  final String img;
  final String detail;
  final List<dynamic> gallery;
  final double lat;
  final double long;

  POI({
    required this.name,
    required this.location,
    required this.rating,
    required this.img,
    required this.detail,
    required this.gallery,
    required this.lat,
    required this.long
  });

  factory POI.fromJson(Map<String, dynamic> json) {
    return POI(
      name: json['name'],
      location: json['location'],
      rating: json['rating'],
      img: json['img'],
      detail: json['detail'],
      gallery: json['gallery'],
      lat: json['lat'],
      long: json['long'],
    );
  }

  @override
  String toString() {
    return 'POI{name: $name, location: $location, rating: $rating, img: $img, detail: $detail, lat: $lat, long: $long}';
  }
}
