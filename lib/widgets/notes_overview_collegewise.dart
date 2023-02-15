import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_sharing_app/Provider/notes.dart';
import 'package:notes_sharing_app/widgets/Card/collegewise_notes_card.dart';
import 'package:provider/provider.dart';

class NotesOverviewCollegeWise extends StatelessWidget {
  const NotesOverviewCollegeWise({super.key});

  @override
  Widget build(BuildContext context) {
    final notesList = Provider.of<NotesList>(context);
    final listOfNotes = notesList.getNotesList;
    log("This is the list of data ${listOfNotes.length}");

    return GridView.count(
      scrollDirection: Axis.horizontal,
      // itemCount: listOfNotes.length,
      padding: const EdgeInsets.all(28),
      // // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   mainAxisSpacing: 8,
      //   crossAxisSpacing: 8,
      //   childAspectRatio: 3.2 / 4,
      //   maxCrossAxisExtent: 20.00,
      // )
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: List.generate(listOfNotes.length, (i) {
        return CollegewiseNotesCard(
          title: listOfNotes[i].title,
          id: listOfNotes[i].id,
          imageUrl: listOfNotes[i].imageUrl,
          price: listOfNotes[i].price,
          collegOrSchool: listOfNotes[i].collegeOrSchool,
        );
      }
      // itemBuilder: (context, i) {
      //   return CollegewiseNotesCard(
      //     title: listOfNotes[i].title,
      //     id: listOfNotes[i].id,
      //     imageUrl: listOfNotes[i].imageUrl,
      //     price: listOfNotes[i].price,
      //     collegOrSchool: listOfNotes[i].collegeOrSchool,
      //   );
      // },
    ),);
  }
}
