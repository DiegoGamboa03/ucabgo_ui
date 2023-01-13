import 'package:flutter/widgets.dart';
import '../classes/trip_request.dart';

class TripsRequests with ChangeNotifier {
  List<TripRequest> _tripsRequest = [];

  List<TripRequest> get tripsRequest => _tripsRequest;

  void addTripRequest(TripRequest value) {
    _tripsRequest.add(value);
    notifyListeners();
  }

  void eraseTripRequest() {
    _tripsRequest = [];
    notifyListeners();
  }

  void addTripsRequest(List<TripRequest> value) {
    _tripsRequest.addAll(value);
    notifyListeners();
  }
}
