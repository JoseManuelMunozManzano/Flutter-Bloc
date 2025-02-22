import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  // Para hacer la inyección de dependencias.
  // Esta propiedad privada es una función que voy a llamar.
  final Future<String> Function(int id) _fetchPokemon;

  // Recibimos como argumento una función que asignamos
  // a nuestra propiedad privada.
  PokemonBloc({
    required Future<String> Function(int id) fetchPokemon
  }) : _fetchPokemon = fetchPokemon,
  super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      // Me creo un nuevo mapa basado en el state actual.
      // Esto lo hago porque el state es inmutable.
      final newPokemons = Map<int, String>.from(state.pokemons);

      // Busco si ya existe ese Pokemon.
      // Si existe lo actualiza, y si no lo crea.
      newPokemons[event.id] = event.name;

      // Creamos el nuevo state con los nuevos pokemon usando copyWith.
      emit(state.copyWith(pokemons: newPokemons));

      // Podríamos hacer un método privado para delegar esta funcionalidad.
      // Esto ya lo hemos hecho en otro bloc.
    });
  }

  Future<String> fetchPokemonName(int id) async {
    // Uso del caching
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }

    try {
      // Para inyectar la dependencia quitamos la referencia directa a la función.
      //final pokemonName = await PokemonInformation.getPokemonName(id);
      // Y mandamos a llamar la función inyectada en el constructor.
      final pokemonName = await _fetchPokemon(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
