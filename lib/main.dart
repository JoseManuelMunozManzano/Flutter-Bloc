import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

void main() {
  // Llamamos a nuestro Service Locator.
  // Si tuviésemos inicializaciones asíncronas, podríamos hacer
  // void main() async {await serviceLocatorInit(); ...}
  serviceLocatorInit();

  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      // Aquí decimos: ve a getIt (nuestro Service Locator) a buscar estas instancias.
      // Ver main_copy.dart para explicaciones de este código.
      BlocProvider(create: (context) => getIt<UsernameCubit>()),
      BlocProvider(create: (context) => getIt<RouterSimpleCubit>()),
      BlocProvider(create: (context) => getIt<CounterCubit>()),
      BlocProvider(create: (context) => getIt<ThemeCubit>()),
      BlocProvider(create: (context) => getIt<GuestsBloc>()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
    );
  }
}
