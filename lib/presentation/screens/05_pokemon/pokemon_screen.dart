import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

// StatefulWidget porque vamos a mantener un estdo en el Widget, y,
// con ese estado local, vamos a hacer modificaciones en nuestros blocs.
class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;

  @override
  Widget build(BuildContext context) {
    // Usamos read() porque no nos interesa si el bloc cambia o no.
    // NO vamos a redibujar el Widget.
    final pokemonBloc = context.read<PokemonBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text('PokémonID: $pokemonId'),
        ),
        body: Center(
          child: FutureBuilder(
            future: pokemonBloc.fetchPokemonName(pokemonId),
            initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'Loding...',
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              // Todavía estoy cargando información (resolviendo el Future)
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              return Text(snapshot.data);
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-add',
              child: const Icon(Icons.plus_one),
              onPressed: () {
                pokemonId++;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: 'btn-minus',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                // Esto lo podemos hacer así o delegarlo en el bloc
                if (pokemonId <= 1) return;

                pokemonId--;
                setState(() {});
              },
            ),
          ],
        ));
  }
}
