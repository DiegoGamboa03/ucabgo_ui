import 'package:ucabgo_ui/classes/passenger.dart';

import '../helpers/api_service.dart';

class TripRequestPassenger {
  String id;
  String tripId;
  String driverid;
  String driverName;
  String status;

  TripRequestPassenger({
    required this.id,
    required this.tripId,
    required this.driverid,
    required this.driverName,
    required this.status,
  });

  factory TripRequestPassenger.fromJson(Map<String, dynamic> json) {
    return TripRequestPassenger(
      id: json['id'],
      tripId: json['trip'],
      driverid: json['driverid'],
      driverName: json['drivername'],
      status: json['status'],
    );
  }
}
