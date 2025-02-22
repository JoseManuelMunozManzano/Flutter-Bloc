import 'package:get_it/get_it.dart';
import 'package:blocs_app/config/config.dart';

import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  // Creamos las instancias de nuestros Cubits, en este caso como Singleton.
  // Son los Cubit que tenemos en main_copy.dart, en la clase BlocsProviders.
  // Si es necesario, podemos crear Singletons de manera Lazy.
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());

  getIt.registerSingleton(GuestsBloc());

  // Inyectando una dependencia.
  getIt.registerSingleton(PokemonBloc(fetchPokemon: PokemonInformation.getPokemonName));

  // Operador de cascada.
  // Una vez creada la instancia, empiezo a emitir cambios en la localización del usuario.
  getIt.registerSingleton(GeolocationCubit()..watchUserLocation());

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
