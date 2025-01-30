import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notepade_3/dto/note_list.dart';
import 'package:notepade_3/models/note_model.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  final NoteList dto = NoteList();

  NotesListBloc() : super(NotesListInitial()) {
    on<NotesListLoad>((event, emit) async {
      emit(NotesListLoading());
      await dto.init();
      final test = await dto.getNotes();
      emit(NotesListShowing(model: test));
    });

    on<NotesListAddNew>((event, emit) async {
      //emit(NotesListLoading());
      await dto.box.add(
        NoteModel(
          headerPart: "New Record ${DateTime.now()}",
          mainPart: "Lorem",
          createAt: DateTime.now(),
        ),
      );
      emit(NotesListShowing(model: await dto.getNotes()));
    });
  }
}
