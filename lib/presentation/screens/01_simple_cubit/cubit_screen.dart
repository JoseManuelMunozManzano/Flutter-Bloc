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

    // Hay muchas formas de trabajar con nuestros Cubits y Blocs.
    // Una muy sencilla pero poderosa es esta usando watch().
    // Cuando hay un cambio redibuja el widget.
    // Nota: El Scaffold y el AppBar se van a reevaluar y si no ha cambiado no se redibujan.
    // Hay una forma (BlockBuilder), que veremos luego para que no necesite ni reevaluarse.
    //
    // Indicar que usernameCubit es la instancia de UsernameCubit.
    final usernameCubit = context.watch<UsernameCubit>();

    // A diferencia de la línea anterior, esto ya es un string, no una instancia.
    // final usernameCubit = context.watch<UsernameCubit>().state;

    // Y si solo queremos leer el estado y que un cambio no redibuje el Widget:
    // read es lo que se va a usar el 100% de las veces en métodos.
    // final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: Text(usernameCubit.state),
      ),
      // Con esta acción cambiamos el valor del String usernameCubit
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          usernameCubit.setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
