import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepade_3/dto/note_list.dart';
import 'package:notepade_3/functional_elements/note_card.dart';
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
        seedColor: Color.fromRGBO(0, 157, 255, 1),
        brightness: Brightness.dark,
      )),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: newMethod,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          shadowColor: Theme.of(context).colorScheme.secondaryFixed,
          scrolledUnderElevation: 10,
          elevation: 3,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Super Заметки 3.0",
            style: GoogleFonts.robotoSlab(),
          ),
        ),
        body: Center(
            child: Container(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          height: double.infinity,
          width: 800,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "Search",
                            style: GoogleFonts.robotoSlab(),
                          ))),
                ),
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    NoteCard(
                      text: "drrrrrrrr",
                    ),
                    NoteCard(
                      text:
                          "drrrfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrr",
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void newMethod() async {
    NoteList dto = NoteList();

    await dto.init();

    dto.box.add(NoteModel(
        headerPart: "headerPart",
        mainPart: "mainPart",
        createAt: DateTime.now()));

    log(dto.box.values.length.toString());
  }
}
