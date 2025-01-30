import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepade_3/functional_elements/my_interval_widget.dart';
import 'package:notepade_3/models/note_model.dart';

Future<void> main() async {
  await Hive.initFlutter("/adv");
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 51, 255),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyIntervalWidget(),
    );
  }
}
