part of 'notes_list_bloc.dart';

@immutable
sealed class NotesListState {}

final class NotesListInitial extends NotesListState {}

final class NotesListShowing extends NotesListState {
  final List<NoteModel> model;

  NotesListShowing({required this.model});
}

final class NotesListLoading extends NotesListState {}

final class NotesListError extends NotesListState {}
