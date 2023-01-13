import 'package:ucabgo_ui/classes/passenger.dart';

import '../helpers/api_service.dart';

class TripRequest {
  String id;
  String tripId;
  String passengerId;
  String status;
  Passenger passenger;

  TripRequest(
      {required this.id,
      required this.tripId,
      required this.passengerId,
      required this.status,
      required this.passenger});

  factory TripRequest.fromJson(Map<String, dynamic> json) {
    return TripRequest(
      id: json['_id'],
      tripId: json['trip'],
      passengerId: json['passenger'],
      status: json['status'],
      passenger: Passenger(
          username: json['username'],
          email: json['email'],
          age: json['age'],
          role: json['role'],
          gender: json['gender'],
          major: json['major'],
          semester: json['semester']),
    );
  }
}
