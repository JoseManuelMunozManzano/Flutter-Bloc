import 'package:bloc/bloc.dart';

// Cubit Simple
//
// Es un Bloc simplificado
// Cubit se puede exportar de bloc o de flutter_bloc
// Tenemos que indicar que tipo de dato va a manejar
// Esta clase nos permite tener de manera global para toda la aplicación el String 'no-username'
//
// Ahora tenemos que hacer que Flutter sepa que tiene que integrarlo en nuestro árbol de widgets (context).
// Así, todos los widgets tendrán acceso a este string.
// Esto se hace en main.dart

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username');

  // Lo que buscamos con nuestros blocs es que la lógica que usamos para llamar a métodos resida en
  // nuestro gestor de estado.
  // Técnicamente, nuestro gestor de estados solo debería llamar repositorios que están conectados a
  // datasources.
  //
  // En este método emitimos un nuevo estado, que notificará a todos los Widgets que están pendientes
  // (watch) de este Cubit que el valor ha cambiado, y esos Widgets se redibujarán.
  void setUsername(String username) {
    emit(username);
  }
}
