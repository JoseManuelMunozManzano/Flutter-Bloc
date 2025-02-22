part of 'historic_location_bloc.dart';

class HistoricLocationState extends Equatable {
  // Lista de record.
  final List<(double lat, double lng)> locations;

  const HistoricLocationState({
    this.locations = const [],
  });

  HistoricLocationState copyWith({
    List<(double lat, double lng)>? locations,
  }) => HistoricLocationState(
    locations: locations ?? this.locations,
  );

  // Para determinar si un objeto es igual a otro. En este caso solo
  // tenemos locations.
  @override
  List<Object> get props => [locations];
}
