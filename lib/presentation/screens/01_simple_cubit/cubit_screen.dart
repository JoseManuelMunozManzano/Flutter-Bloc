import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:blocs_app/config/config.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // NOTA: Como la instancia de UsernameCubit se creó en main.dart, si salimos de esta
    // screen (destruimos el Widget) y volvemos a entrar no se reinicializa el valor a no-username.
    // Esto es porque no se destruye la instancia.
    // Para que eso pasara, tendríamos que crear la instancia aquí en vez de en main.dart.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        // BlocBuilder sustituye a context.watch() (ver cubit_screen_copy.dart)
        // Es más eficiente que context.watch() pero hay que escribir más código.
        // He usado el snippet blocbuilder.
        // Se indica el cubit y el tipo de estado que maneja ese cubit.
        //
        // Haciéndolo de esta forma (en vez de usar context.watch()),
        // cuando cambia el estado solo se redibuja este pequeño Widget (el Text).
        child: BlocBuilder<UsernameCubit, String>(
          // Incluso podemos indicar cuando queremos que se redibuje, por ejemplo, si solo
          // nos interesa redibujar cuando cambia algo concreto del estado.
          // buildWhen: (previous, current) => previous != current,

          // Este segundo argumento es el valor del estado.
          builder: (context, state) {
            print('Cambió');
            return Text(state);
          },
        )
      ),
      // Con esta acción cambiamos el valor del String usernameCubit
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Esto ya no funciona porque no usamos context.watch()
          // usernameCubit.setUsername(RandomGenerator.getRandomName());

          // Para llamar a la función se usa el context.read()
          context.read<UsernameCubit>().setUsername(
            RandomGenerator.getRandomName()
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
