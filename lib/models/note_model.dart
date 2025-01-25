import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String? headerPart;
  @HiveField(1)
  final String? mainPart;
  @HiveField(2)
  final DateTime createAt;

  NoteModel(
      {required this.headerPart,
      required this.mainPart,
      required this.createAt});
}
