import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    // Instancia de GuestsBloc
    final guestBloc = context.watch<GuestsBloc>();
    final selectedFilter = guestBloc.state.filter;

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invitados')),
            ButtonSegment(value: GuestFilter.noInvited, icon: Text('No invitados')),
          ],
          selected: <GuestFilter>{selectedFilter},
          onSelectionChanged: (value) {
            // Aquí despachamos el evento
            guestBloc.changeFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SwitchListTile(
                  title: const Text('Juan carlos'),
                  value: true,
                  onChanged: (value) {});
            },
          ),
        )
      ],
    );
  }
}
