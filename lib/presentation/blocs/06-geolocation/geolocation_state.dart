part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  // Creamos un record
  final (double lat, double lng) location;
  final bool serviceEnabled;
  final bool permissionGranted;

  const GeolocationState({
    this.location = const(0, 0),
    this.serviceEnabled = false,
    this.permissionGranted = false,
  });

  // Devuelve una nueva instancia de GeolocationState.
  // Así nos aseguramos de que el estado es inmutable.
  GeolocationState copyWith({
    (double lat, double lng)? location,
    bool? serviceEnabled,
    bool? permissionGranted,
  }) {
    return GeolocationState(
      location: location ?? this.location,
      serviceEnabled: serviceEnabled ?? this.serviceEnabled,
      permissionGranted: permissionGranted ?? this.permissionGranted
    );
  }

  // Indicamos lo que, al cambiar, queremos que sea un nuevo estado.
  @override
  List<Object> get props => [location, serviceEnabled, permissionGranted];
}
