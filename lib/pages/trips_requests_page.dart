import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ucabgo_ui/components/trip_request_card.dart';
import 'package:ucabgo_ui/providers/trips_requests_provider.dart';

class TripRequestPage extends StatefulWidget {
  const TripRequestPage({super.key});

  @override
  State<TripRequestPage> createState() => _TripRequestPageState();
}

class _TripRequestPageState extends State<TripRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TripsRequests>(context, listen: true)
            .tripsRequest
            .isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Provider.of<TripsRequests>(context, listen: true)
                .tripsRequest
                .length,
            itemBuilder: (BuildContext context, int index) {
              if (Provider.of<TripsRequests>(context, listen: false)
                  .tripsRequest
                  .isNotEmpty) {
                return TripRequestCard(
                    tripRequest:
                        Provider.of<TripsRequests>(context, listen: true)
                            .tripsRequest[index]);
              }
              return Container();
            },
          )
        : const Text('No hay solicitudes disponibles');
  }
}
