import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepade_3/bloc/notes_list/notes_list_bloc.dart';
import 'package:notepade_3/functional_elements/note_card.dart';

class MySecondIntervalWidget extends StatelessWidget {
  const MySecondIntervalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<NotesListBloc>().add(NotesListAddNew()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.secondaryFixed,
        scrolledUnderElevation: 10,
        elevation: 3,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Super Заметки 3.0",
          style: GoogleFonts.robotoSlab(),
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.onSecondaryFixed,
          height: double.infinity,
          width: 800,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(
                        "Search",
                        style: GoogleFonts.robotoSlab(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<NotesListBloc, NotesListState>(
                  builder: (context, state) {
                    log(state.toString());
                    if (state is NotesListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NotesListShowing) {
                      log(state.model.length.toString());
                      if (state.model.isNotEmpty) {
                        return SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: state.model
                                .map(
                                  (e) => NoteCard(model: e),
                                )
                                .toList(),
                          ),
                        );
                      }
                      return const Text("Сорри, но тут ошибка");
                    } else {
                      return const Text("Сорри, но тут ошибка");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
