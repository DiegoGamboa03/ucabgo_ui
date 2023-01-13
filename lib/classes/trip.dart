import 'package:ucabgo_ui/classes/point.dart';

class Trip {
  String id;
  String username;
  String userID;
  List<dynamic> polygon;
  List<dynamic> polyline;

  Trip(
      {required this.id,
      required this.username,
      required this.userID,
      required this.polygon,
      required this.polyline});
}
