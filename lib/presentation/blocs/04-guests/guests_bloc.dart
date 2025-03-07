import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:uuid/uuid.dart';

import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

// El bloc amarra aquí las dos piezas (GuestsEvent y GuestsState)
class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(

            // Por ahora hardcode.
            // Esto nunca se hará así en el mundo real, es solo para fines educativos.
            guests: [
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: DateTime.now()),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: DateTime.now()),
              Todo(
                  id: uuid.v4(),
                  description: RandomGenerator.getRandomName(),
                  completedAt: null),
            ])) {
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

    // Delegamos la lógica a la función _addGuestHandler()
    on<AddGuest>(_addGuestHandler);

    on<ToggleGuest>(_toggleGuestHandler);
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

  // Despachamos el evento
  // Podríamos devolver el Todo, pero vamos a devolver void
  void addGuest(String name) {
    add(AddGuest(name));
  }

  void toggleGuest(String id) {
    add(ToggleGuest(id));
  }

  // Delegamos aquí toda la lógica que tendría en on
  // Necesitamos el event y el emit.
  // Estos métodos se suelen hacer privados.
  void _addGuestHandler(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuest event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {

      if (guest.id == event.id) {
        return guest.copyWith(
          completedAt: guest.completedAt == null ? DateTime.now() : null);
      }

      return guest;
    }).toList();

    emit(state.copyWith(guests: newGuests));
  }
}
