import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepade_3/dto/note_list.dart';
import 'package:notepade_3/models/note_model.dart';

// ignore: must_be_immutable
class OneNote extends StatelessWidget {
  final NoteModel model;

  Color col = Color.fromRGBO(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.4);

  OneNote({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.white60,
            ),
          ),
        ],
        shadowColor: col,
        scrolledUnderElevation: 10,
        elevation: 5,
        backgroundColor: col,
        title: Text(
          "Super Заметки 3.0",
          style: GoogleFonts.robotoSlab(),
        ),
      ),
      body: Center(
          child: Container(
        color: col.withAlpha(40),
        height: double.infinity,
        width: 800,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        model.headerPart == null
                            ? "Go Write!"
                            : model.headerPart!,
                        style: GoogleFonts.robotoSlab(),
                      ))),
              Expanded(
                child: TextField(
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        border: OutlineInputBorder(),
                        label: Text(
                          model.mainPart == null
                              ? "Go Write!"
                              : model.mainPart!,
                          style: GoogleFonts.robotoSlab(),
                        ))),
              ),
              FilledButton(onPressed: () {}, child: Text("Save"))
            ],
          ),
        ),
      )),
    );
  }

  void newData() async {
    NoteList dto = NoteList();

    await dto.init();
  }
}
