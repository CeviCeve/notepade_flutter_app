import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepade_3/functional_elements/one_note.dart';
import 'package:notepade_3/models/note_model.dart';

class NoteCard extends StatelessWidget {
  /*final String name;
  final String mainPart;
  final String date;*/

  final NoteModel model;

  const NoteCard({super.key, required this.model});

  Color getRandColor() {
    return Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      0.463,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: (Random().nextInt(5) + 2) * 50,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: InkWell(
          onTap: () {
            Navigator.push(context, _createRoute(model: model));
          },
          splashColor: const Color.fromRGBO(0, 157, 255, 0.615),
          hoverColor: getRandColor(),
          hoverDuration: const Duration(seconds: 1),
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.headerPart == null ? "new" : model.headerPart!,
                  style: GoogleFonts.robotoSlab(fontSize: 22),
                ),
                Text(
                  model.mainPart == null ? "write new text" : model.mainPart!,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 184, 208, 219),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    model.createAt == null
                        ? "now date"
                        : model.createAt.toString(),
                    style: GoogleFonts.robotoSlab(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 240, 244, 246),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute({required NoteModel model}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => OneNote(
      model: model,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
