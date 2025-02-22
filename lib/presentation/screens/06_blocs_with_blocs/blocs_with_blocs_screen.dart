import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final geolocationCubit = context.watch<GeolocationCubit>().state.location;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocs con Blocs'),
      ),
      body: Center(
        child: Text('$geolocationCubit'),
      ),
    );
  }
}
