import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepade_3/models/note_model.dart';

class NoteList {
  late Box<NoteModel> box;

  Future<List<NoteModel>> getNotes() async {
    return box.values.toList();
  }

  Future<void> init() async {
    box = await Hive.openBox("name");
  }
}
