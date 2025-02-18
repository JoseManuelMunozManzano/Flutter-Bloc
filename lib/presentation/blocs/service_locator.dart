import 'package:get_it/get_it.dart';
import 'package:blocs_app/config/config.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  // Creamos las instancias de nuestros Cubits, en este caso como Singleton.
  // Son los Cubit que tenemos en main_copy.dart, en la clase BlocsProviders.
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());

  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc());

  // ¿Para qué vale esto?
  // Imaginemos que necesitamos pasar a TheneCubit el valor del estado de UsernameCubit
  // Lo haríamos en el método así:
  //
  // final usernameCubit = getIt.registerSingleton(UsernameCubit());
  // final user = usernameCubit.state;
  // getIt.registerSingleton(ThemeCubit(user));

  // Lo que he creado en el código son instancias.
  // Pero también podemos estar pendientes de los cambios de los estados, usando streams.
  // Por ejemplo:
  //
  // final themeCubit = getIt.registerSingleton(ThemeCubit());
  // themeCubit.stream.listen((event) {});
}
