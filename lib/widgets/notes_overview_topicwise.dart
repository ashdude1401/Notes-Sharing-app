import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_sharing_app/Provider/notes.dart';
import 'package:notes_sharing_app/widgets/Card/topicwise_notes_card.dart';
import 'package:provider/provider.dart';

class NotesOverviewTopicWise extends StatelessWidget {
  const NotesOverviewTopicWise({super.key});

  @override
  Widget build(BuildContext context) {
    final notesList = Provider.of<NotesList>(context);
    final listOfNotes = notesList.getNotesList;
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listOfNotes.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 5 / 6,
          maxCrossAxisExtent: 250),
      itemBuilder: ((context, i) {
        return TopicwiseNotesCard(
            title: listOfNotes[i].title,
            id: listOfNotes[i].id,
            imageUrl: listOfNotes[i].imageUrl,
            price: listOfNotes[i].price);
      }),
    );
  }
}
