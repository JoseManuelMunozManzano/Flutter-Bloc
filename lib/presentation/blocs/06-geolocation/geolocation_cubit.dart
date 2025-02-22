import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  // Mediante inyección de dependencias y método asíncronos
  // podríamos mandar de antemano el estado.
  // Como son ejemplos, los valores se inicializan directamente
  // en el constructor de GeolocationState().
  GeolocationCubit() : super(const GeolocationState());

  Future<void> checkStatus() async {
    // Verificar Geolocation y Permissions
  }

  void watchUserLocation() {
    // Obtener la ubicación del usuario
  }
}
