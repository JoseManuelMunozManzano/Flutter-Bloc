import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:blocs_app/presentation/screens/screens.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/simple-cubit',
    builder: (context, state) => const CubitScreen(),
  ),
  GoRoute(
    path: '/cubit-router',
    builder: (context, state) => const RouterScreen(),
  ),
  GoRoute(
    path: '/cubit-state',
    builder: (context, state) => const MultipleCubitScreen(),
  ),
  GoRoute(
    path: '/guest-bloc',
    builder: (context, state) => const GuestsScreen(),
  ),
  GoRoute(
    path: '/pokemon-bloc',
    builder: (context, state) => const PokemonScreen(),
  ),
  GoRoute(
    path: '/blocs-with-blocs',
    builder: (context, state) => const BlocsWithBlocsScreen(),
  ),
]);

// Nos creamos un Cubit para nuestro sistema de rutas.
class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_publicRouter);

  // En este Cubit me puedo crear mi sistema de navegación.
  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }
}
