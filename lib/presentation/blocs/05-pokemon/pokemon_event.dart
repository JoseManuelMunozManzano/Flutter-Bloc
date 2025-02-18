part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

// Evento en el que el usuario solicita un nuevo pokemon.
class PokemonAdded extends PokemonEvent {
  final int id;
  final String name;

  const PokemonAdded(this.id, this.name);

  // Esto es de Equatable.
  // Indicamos cuando un estado ha cambiado.
  // En este caso, cambia cuando cambia el valor del id o del name.
  @override
  List<Object> get props => [id, name];
}
