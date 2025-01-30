import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepade_3/models/note_model.dart';

// ignore: must_be_immutable
class OneNote extends StatelessWidget {
  final NoteModel model;

  late String mainPart;
  late String headerPart;

  Color col = Color.fromRGBO(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    0.4,
  );

  OneNote({super.key, required this.model}) {
    mainPart = model.mainPart.toString();
    headerPart = model.headerPart.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
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
                TextFormField(
                  onChanged: (value) {
                    headerPart = value;
                  },
                  initialValue: model.headerPart == null
                      ? "Go Write!"
                      : model.headerPart!,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(
                      "Header",
                      style: GoogleFonts.robotoSlab(),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      mainPart = value;
                    },
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    initialValue:
                        model.mainPart == null ? "Go Write!" : model.mainPart!,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      border: const OutlineInputBorder(),
                      label: Text(
                        "Main",
                        style: GoogleFonts.robotoSlab(),
                      ),
                    ),
                  ),
                ),
                FilledButton(onPressed: () {}, child: const Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
