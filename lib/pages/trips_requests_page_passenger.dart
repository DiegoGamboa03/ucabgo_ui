import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../components/trip_request_card_passenger.dart';
import '../providers/trips_requests_passenger_provider.dart';

class TripsRequestPassengerPage extends StatefulWidget {
  const TripsRequestPassengerPage({super.key});

  @override
  State<TripsRequestPassengerPage> createState() =>
      _TripsRequestPassengerPageState();
}

class _TripsRequestPassengerPageState extends State<TripsRequestPassengerPage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TripsRequestsPassenger>(context, listen: true)
            .tripsRequest
            .isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                Provider.of<TripsRequestsPassenger>(context, listen: true)
                    .tripsRequest
                    .length,
            itemBuilder: (BuildContext context, int index) {
              if (Provider.of<TripsRequestsPassenger>(context, listen: false)
                  .tripsRequest
                  .isNotEmpty) {
                return TripRequestCard(
                    tripRequest: Provider.of<TripsRequestsPassenger>(context,
                            listen: true)
                        .tripsRequest[index]);
              }
              return Container();
            },
          )
        : const Text('No hay solicitudes disponibles');
  }
}
