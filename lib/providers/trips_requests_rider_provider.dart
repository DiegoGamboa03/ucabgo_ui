import 'package:flutter/widgets.dart';
import '../classes/trip_request_rider.dart';

class TripsRequestsRider with ChangeNotifier {
  List<TripRequestRider> _tripsRequest = [];

  List<TripRequestRider> get tripsRequest => _tripsRequest;

  void addTripRequest(TripRequestRider value) {
    _tripsRequest.add(value);
    notifyListeners();
  }

  void eraseTripRequest() {
    _tripsRequest = [];
    notifyListeners();
  }

  void addTripsRequest(List<TripRequestRider> value) {
    _tripsRequest.addAll(value);
    notifyListeners();
  }
}
