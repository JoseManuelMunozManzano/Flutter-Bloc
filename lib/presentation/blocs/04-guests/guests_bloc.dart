import 'package:bloc/bloc.dart';

import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

// El bloc amarra aquí las dos piezas (GuestsEvent y GuestsState)
class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    // Este on es el handler que va a estar escuchando eventos y decidiendo que
    // se tiene que hacer cuando llega uno (como cambia el estado).
    // emit() es lo que emite el nuevo estado (lo mismo que vismo en Cubit).
    // emit() solo se puede hacer en el constructor.
    //
    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });

    // on<SetNoInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.noInvited));
    // });

    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });

    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }

  // Se pueden disparar (despachar) los eventos desde cualquier lado,
  // pero en lo personal prefiero que sea el bloc quien administre esos eventos.
  // Basado en el filtro recibido despacho uno los eventos de arriba.
  // Se usa el método add() para añadir un nuevo evento al bloc. El bloc lo analiza y ejecuta el emit.
  void changeFilter(GuestFilter newFilter) {
    // Indicar que esto lo hacemos así porque es educativo.
    // switch (newFilter) {
    //   case GuestFilter.all:
    //     add(SetAllFilterEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterEvent());
    //     break;
    //   case GuestFilter.noInvited:
    //     add(SetNoInvitedFilterEvent());
    //     break;
    // }

    // En la vida real usamos la clase SetCustomFilterEvent() creada en guests_event.dart
    add(SetCustomFilterEvent(newFilter));
  }
}
