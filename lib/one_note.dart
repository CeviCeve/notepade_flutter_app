import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class OneNote extends StatelessWidget {
  Color col = Color.fromRGBO(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 0.4);

  OneNote({super.key});

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
                        "Heading",
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
                          "Main",
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
}
