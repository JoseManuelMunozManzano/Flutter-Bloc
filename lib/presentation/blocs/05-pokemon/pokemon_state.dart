part of 'pokemon_bloc.dart';

// Como quiero que funcione mi estado:
/* Las peticiones se van a ir acumulando en un mapa (el state)
   Si alguien hace una petición que esté en mi state, ya tengo su descripción.
   Es como usar un caching.

  {
    1: string,
    2: string,
    3: string,
    4: string,
  }
*/

// Quitamos la palabra reservada sealed porque queremos poder crear instancias.
class PokemonState extends Equatable {
  final Map<int, String> pokemons;

  const PokemonState({
    this.pokemons = const {}
  });

  // copyWith regresa una instancia nueva.
  // Esto es bueno hacerlo siempre, aunque solo tengamos una propiedad.
  // Puede que el día de mañana tengamos que añadir otra.
  PokemonState copyWith({
    Map<int, String>? pokemons
  }) => PokemonState(
    pokemons: pokemons ?? this.pokemons
  );

  @override
  List<Object> get props => [];
}

// Esto no lo usamos. Usamos directamente la clase
// final class PokemonInitial extends PokemonState {}
