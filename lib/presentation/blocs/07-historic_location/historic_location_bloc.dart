import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {

    on<NewLocation>(_onNewLocationHandler);

  }

  void _onNewLocationHandler(NewLocation event, Emitter<HistoricLocationState> emit) {
    emit(state.copyWith(
      locations: [...state.locations, event.location]
    ));
  }

  // Esta función nos sirve para evitar acoplamiento entre blocs.
  // Vamos a exponer este método y, cuando alguien lo llame,
  // colocamos el evento que nos va a servir para actualizar el estado.
  void onNewUserLocation((double lat, double lng) location) {
    add(NewLocation(location));
  }
}
