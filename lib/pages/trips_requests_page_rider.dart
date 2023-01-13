import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/components/trip_request_card.dart';
import 'package:ucabgo_ui/providers/trips_requests_rider_provider.dart';

class TripRequestRiderPage extends StatefulWidget {
  const TripRequestRiderPage({super.key});

  @override
  State<TripRequestRiderPage> createState() => _TripRequestRiderPageState();
}

class _TripRequestRiderPageState extends State<TripRequestRiderPage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TripsRequestsRider>(context, listen: true)
            .tripsRequest
            .isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Provider.of<TripsRequestsRider>(context, listen: true)
                .tripsRequest
                .length,
            itemBuilder: (BuildContext context, int index) {
              if (Provider.of<TripsRequestsRider>(context, listen: false)
                  .tripsRequest
                  .isNotEmpty) {
                return TripRequestCard(
                    tripRequest:
                        Provider.of<TripsRequestsRider>(context, listen: true)
                            .tripsRequest[index]);
              }
              return Container();
            },
          )
        : const Text('No hay solicitudes disponibles');
  }
}
