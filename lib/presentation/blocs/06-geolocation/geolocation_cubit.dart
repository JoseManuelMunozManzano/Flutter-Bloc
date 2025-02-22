import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  // Inyectamos una dependencia opcional, porque puede que la manden o no.
  // Vamos a llamar al método creado en historic_location_bloc.dart
  final void Function((double lat, double lng) location)? onNewUserLocationCallback;

  GeolocationCubit({
    this.onNewUserLocationCallback,
  }) : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // Evaluo si ya me han dado permiso antes.
    // Si no, pido el permiso.
    LocationPermission permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      serviceEnabled: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.always ||
          permissionGranted == LocationPermission.whileInUse,
    ));
  }

  Future<void> watchUserLocation() async {
    await checkStatus();

    if (!state.permissionGranted || !state.serviceEnabled) return;

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 15,
    );

    // Pendiente de todos los cambios de ubicaciones.
    // Emitimos la última ubicación conocida.
    Geolocator.getPositionStream(locationSettings: locationSettings)
    .listen((position) {
      final newLocation = (position.latitude, position.longitude);
      emit(state.copyWith(location: newLocation));
      // print(newLocation);

      // Mandamos llamar al método del otro bloc (historic_location_bloc.dart)
      // si existe (de ahí el ?  y el .call)
      onNewUserLocationCallback?.call(newLocation);
    });
  }
}
