import 'package:equatable/equatable.dart';

// Indicamos con Equatable cuando un Todo es diferente a otro.
// Lo único malo que veo es que incluyo en el dominio una dependencia de terceros.
class Todo extends Equatable {
  final String id;
  final String description;
  final DateTime? completedAt;

  const Todo({
    required this.id,
    required this.description,
    required this.completedAt,
  });

  bool get done {
    return completedAt != null; // true or false
  }

  Todo copyWith({
    String? id,
    String? description,
    DateTime? completedAt,
  }) =>
      Todo(
        id: id ?? this.id,
        description: description ?? this.description,
        completedAt: completedAt,
      );

  // Esta es la parte de Equatable.
  // Indico en el arreglo todas las propiedades para que, si cambia alguna,
  // sea considerado un Todo distinto.
  // Object? aparece con esa interrogación porque completedAt puede ser nulos.
  @override
  List<Object?> get props => [id, description, completedAt];
}
