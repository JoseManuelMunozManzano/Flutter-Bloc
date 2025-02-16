import 'package:bloc/bloc.dart';

import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

// El bloc amarra aquí las dos piezas (GuestsEvent y GuestsState)
class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {

  GuestsBloc() : super(const GuestsState()) {

    // Este on es el que va a estar escuchando eventos.
    // Lo configuramos más tarde.
    // on<GuestsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
