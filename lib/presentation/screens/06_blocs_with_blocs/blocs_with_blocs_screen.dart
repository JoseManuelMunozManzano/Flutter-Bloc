import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Este ya no lo uso, pero recordar que en service_locator.dart siempre
    // está emitiendo localizaciones.
    // final geolocationCubit = context.watch<GeolocationCubit>().state.location;

    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;

    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicaciones: ${locationState.howManyLocations}'),
        ),
        body: ListView.builder(
            itemCount: locationState.howManyLocations,
            itemBuilder: (BuildContext context, int index) {
              final location = locationState.locations[index];
              final (lat, lng) = location;

              return ListTile(
                title: Text('Lat: $lat, Lng: $lng'),
              );
            }));
  }
}
