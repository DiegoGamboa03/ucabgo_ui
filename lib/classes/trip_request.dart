class TripRequest {
  String id;
  String tripId;
  String passengerId;
  String status;

  TripRequest(
      {required this.id,
      required this.tripId,
      required this.passengerId,
      required this.status});

  factory TripRequest.fromJson(Map<String, dynamic> json) {
    return TripRequest(
        id: json['_id'],
        tripId: json['trip'],
        passengerId: json['passenger'],
        status: json['status']);
  }
}
