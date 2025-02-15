import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool darkMode = false
  }) : super(ThemeState(isDarkMode: darkMode));

  // Este es nuestro Cubit, donde tenemos el estado.
  // Podemos hacer aquí muchas cosas.
  // Por ejemplo, este toggle, donde emitimos un nuevo estado con el valor opuesto del estado actual.
  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void setDarkMode() {
    emit(const ThemeState(isDarkMode: true));
  }

  void lightMode() {
    emit(const ThemeState(isDarkMode: false));
  }
}
