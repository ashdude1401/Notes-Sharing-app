import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_sharing_app/Provider/notes.dart';
import 'package:notes_sharing_app/widgets/notes_card.dart';
import 'package:provider/provider.dart';

class NotesOverview extends StatelessWidget {
  const NotesOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final notesList = Provider.of<NotesList>(context);
    final listOfNotes = notesList.getNotesList;
    return Scaffold(
      body: GridView.builder(
        itemCount: listOfNotes.length,
        padding: const EdgeInsets.all(28),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3.2 / 4,
            maxCrossAxisExtent: 350),
        itemBuilder: ((context, i) {
          return NotesCard(
              title: listOfNotes[i].title,
              id: listOfNotes[i].id,
              imageUrl: listOfNotes[i].imageUrl,
              price: listOfNotes[i].price);
        }),
      ),
    );
  }
}
