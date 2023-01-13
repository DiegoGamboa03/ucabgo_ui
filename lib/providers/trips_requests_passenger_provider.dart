import 'package:flutter/widgets.dart';
import '../classes/trip_request_passenger.dart';
import '../classes/trip_request_rider.dart';

class TripsRequestsPassenger with ChangeNotifier {
  List<TripRequestPassenger> _tripsRequest = [];

  List<TripRequestPassenger> get tripsRequest => _tripsRequest;

  void addTripRequest(TripRequestPassenger value) {
    _tripsRequest.add(value);
    notifyListeners();
  }

  void eraseTripRequest() {
    _tripsRequest = [];
    notifyListeners();
  }

  void addTripsRequest(List<TripRequestPassenger> value) {
    _tripsRequest.addAll(value);
    notifyListeners();
  }
}
