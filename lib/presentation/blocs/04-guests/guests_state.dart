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
    this.guests = const[],
  });

  // Estas son las condiciones en las que quiero que el estado sea considerado como cambiado.
  @override
  List<Object> get props => [filter, guests];
}

// Esto no lo usamos. Lo gestionamos en la clase
// final class GuestsInitial extends GuestsState {}
