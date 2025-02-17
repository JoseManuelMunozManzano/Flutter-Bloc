part of 'guests_bloc.dart';

// Un sealed class es parecido a un abstract class en el sentido de que no se pueden instanciar.
sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

// Para el botón Todos
final class SetAllFilterEvent extends GuestsEvent {}

// Para el botón Invitados
final class SetInvitedFilterEvent extends GuestsEvent {}

// Para el botón No Invitados
final class SetNoInvitedFilterEvent extends GuestsEvent {}

// Cuando se pasa el filtro deseado
final class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter newFilter;

  const SetCustomFilterEvent(this.newFilter);
}

final class AddGuest extends GuestsEvent {
  final String name;
  const AddGuest(this.name);
}
