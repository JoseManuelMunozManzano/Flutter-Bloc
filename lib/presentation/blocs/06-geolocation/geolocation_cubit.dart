import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  // Mediante inyección de dependencias y método asíncronos
  // podríamos mandar de antemano el estado.
  // Como son ejemplos, los valores se inicializan directamente
  // en el constructor de GeolocationState().
  GeolocationCubit() : super(const GeolocationState());

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
      // TODO: Aquí ya sabemos la ubicación del usuario.
      final newLocation = (position.latitude, position.longitude);
      emit(state.copyWith(location: newLocation));
      // print(newLocation);
    });
  }
}
