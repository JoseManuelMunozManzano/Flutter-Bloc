import 'package:bloc/bloc.dart';

// Cubit Simple
//
// Es un Bloc simplificado
// Cubit se puede exportar de bloc o de flutter_bloc
// Tenemos que indicar que tipo de dato va a manejar
// Esta clase nos permite tener de manera global para toda la aplicación el String 'no-username'

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username');
}
