import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepade_3/one_note.dart';

class NoteCard extends StatelessWidget {
  final String text;

  const NoteCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: (Random().nextInt(5) + 2) * 50,
      constraints: BoxConstraints(maxWidth: 400),
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: InkWell(
          onTap: () {
            Navigator.push(context, _createRoute());
          },
          splashColor: Color.fromRGBO(0, 157, 255, 0.615),
          hoverColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 0.463),
          hoverDuration: Duration(seconds: 1),
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data",
                  style: GoogleFonts.robotoSlab(fontSize: 22),
                ),
                Text(
                  text,
                  style: GoogleFonts.robotoSlab(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 184, 208, 219)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => OneNote(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
