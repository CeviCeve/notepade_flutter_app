import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepade_3/bloc/notes_list/notes_list_bloc.dart';
import 'package:notepade_3/functional_elements/my_second_interval_widget.dart';

class MyIntervalWidget extends StatelessWidget {
  const MyIntervalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotesListBloc()..add(NotesListLoad()),
      child: const Center(
        child: MySecondIntervalWidget(),
      ),
    );
  }
}
