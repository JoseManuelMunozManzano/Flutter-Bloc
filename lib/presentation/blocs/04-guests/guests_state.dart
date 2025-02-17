part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

// Eliminamos la palabra reservada sealed ya que quiero poder crear instancias.
class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  int get howManyGuests => guests.length;

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.noInvited:
        return guests.where((guest) => !guest.done).toList();
      case GuestFilter.all:
        return guests;
      default:
        throw Exception('Filter value not valid');
    }
  }

  int get howManyFilteredGuests => filteredGuests.length;

  // Devuelve una nueva instancia de mi estado.
  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) {
    return GuestsState(
      filter: filter ?? this.filter,
      guests: guests ?? this.guests,
    );
  }

  // Estas son las condiciones en las que quiero que el estado sea considerado como cambiado.
  @override
  List<Object> get props => [filter, guests];
}

// Esto no lo usamos. Lo gestionamos en la clase
// final class GuestsInitial extends GuestsState {}
