import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('PokémonID: $pokemonId'),
        ),
        body: const Center(
          child: Text('Fernando Herrera'),
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
