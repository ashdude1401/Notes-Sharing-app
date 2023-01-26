import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import './college_or_school.dart';





class Notes {
  final String id;
  final String title;
  final String description;
  final CollegeOrSchool collegeOrSchool;
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
    collegeOrSchool: CollegeOrSchool(
        id: '1',
        name: 'MIT',
        imageUrl:
            'https://www.mit.edu/style/img/logos/mit-logo.png',
        numberOfNotes: 100,
        courses: ['Math', 'Physics', 'Engineering']),
    board: 'MIT',
    uploader: 'John Doe',
    location: 'Boston, MA',
    uploadDate: DateTime.now(),
    price: 0.0),
  Notes(
    id: '2',
    title: 'Calculus 1',
    description: 'Calculus 1 notes for college students',
    collegeOrSchool: CollegeOrSchool(
        id: '2',
        name: 'Harvard',
        imageUrl:
            'https://www.harvard.edu/sites/default/files/content/harvard_logo_black_1.png',
        numberOfNotes: 150,
        courses: ['Math', 'Physics', 'Business']),
    board: 'Harvard',
    uploader: 'Jane Smith',
    location: 'Cambridge, MA',
    uploadDate: DateTime.now(),
    price: 5.0),
Notes(
id: '3',
title: 'Computer Science',
description: 'Notes for computer science 101 class',
collegeOrSchool:   CollegeOrSchool(
    id: '3',
    name: 'Stanford',
    imageUrl: 'https://www.stanford.edu/sites/default/files/styles/square/public/images/logo-stanford-white.png',
    numberOfNotes: 15,
    courses: ['Computer Science', 'Electrical Engineering', 'Biology'],
  ),
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
collegeOrSchool:   CollegeOrSchool(
    id: '4',
    name: 'High School',
    imageUrl: 'https://www.example.com/high-school-logo.jpg',
    numberOfNotes: 5,
    courses: ['Math', 'Science', 'English'],
  ),
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
