part of 'theme_cubit.dart';

class ThemeState extends Equatable {

  // Propiedades que quiero que tenga mi state
  final bool isDarkMode;

  const ThemeState({
    required this.isDarkMode,
  });

  // Consideraciones para que sea considerado un nuevo estado.
  // Esto es Equatable.
  // Indicamos que el estado cambia cuando cambia isDarkMode.
  @override
  List<Object> get props => [isDarkMode];
}

// Este sería la configuración para un estado inicial
//
//final class ThemeInitial extends ThemeState {}
//
// También podríamos tener configuraciones para otros estados.
// Lo malo es que luego tenemos que evaluar si es estado es dark o light.
//
//final class ThemeDark extends ThemeState {}
//final class ThemeLight extends ThemeState {}
//
// Pero no lo vamos a usar así, sino que lo vamos a manejar como una clase de estado,
// y así ya no tenemos que estar evaluando, y puede tener más propiedades, getters, setters...
