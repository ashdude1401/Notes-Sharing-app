import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Notes {
  final String id;
  final String title;
  final String description;
  final String collegeOrSchool;
  final String board;
  final String uploader;
  final String location;
  final DateTime uploadDate;
  final double price;
  String imageUrl =
      'https://images.unsplash.com/photo-1517971071642-34a2d3ecc9cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1888&q=80';
  bool isFavorite = false;

  Notes({
    required this.id,
    required this.title,
    required this.description,
    required this.collegeOrSchool,
    required this.board,
    required this.uploader,
    required this.location,
    required this.uploadDate,
    required this.price,
    isFavorite,
    imageUrl,
  });
}

List<Notes> dummyNotes = [
Notes(
id: '1',
title: 'Linear Algebra',
description: 'Linear algebra notes for beginners',
collegeOrSchool: 'MIT',
board: 'MIT',
uploader: 'John Doe',
location: 'Boston, MA',
uploadDate: DateTime.now(),
price: 0.0
),
Notes(
id: '2',
title: 'Calculus 1',
description: 'Calculus 1 notes for college students',
collegeOrSchool: 'Harvard',
board: 'Harvard',
uploader: 'Jane Smith',
location: 'Cambridge, MA',
uploadDate: DateTime.now(),
price: 5.0
),
Notes(
id: '3',
title: 'Computer Science',
description: 'Notes for computer science 101 class',
collegeOrSchool: 'Stanford',
board: 'Stanford',
uploader: 'Bob Johnson',
location: 'Stanford, CA',
uploadDate: DateTime.now(),
price: 3.0
),
Notes(
id: '4',
title: 'Chemistry',
description: 'Chemistry notes for high school students',
collegeOrSchool: 'High School',
board: 'High School',
uploader: 'Amy Lee',
location: 'Los Angeles, CA',
uploadDate: DateTime.now(),
price: 0.0
),
];


class NotesList with ChangeNotifier {
  final List<Notes> notesList = [...dummyNotes];

  List<Notes> get getNotesList {
    return [...notesList];
  }
}
