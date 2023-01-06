class AvailableTrip {
  String driver;
  String id;
  int numberPassengers;
  double lat;
  double lng;
  String departureTime;
  String meetingPoint;
  String status;

  AvailableTrip({
    required this.id,
    required this.driver,
    required this.numberPassengers,
    required this.lat,
    required this.lng,
    required this.departureTime,
    required this.meetingPoint,
    required this.status,
  });

  factory AvailableTrip.fromJson(Map<String, dynamic> json) {
    var lat = double.parse(json['latitud']);
    var lng = double.parse(json['longitud']);
    return AvailableTrip(
        id: json['_id'],
        driver: json['driver'],
        numberPassengers: json['numberPassengers'],
        lat: lat,
        lng: lng,
        departureTime: json['departureTime'],
        meetingPoint: json['meetingPoint'],
        status: json['status']);
  }
}
