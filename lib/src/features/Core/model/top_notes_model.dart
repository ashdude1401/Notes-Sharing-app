import 'package:notes_sharing_app/src/constants/image_strings.dart';

class TopNotesModel {
  final String img;
  final String branch;
  final String topic;
  final String topperName;

  TopNotesModel(
      {required this.img,
      required this.branch,
      required this.topic,
      required this.topperName});

  static List<TopNotesModel> topNotesList = [
    TopNotesModel(
      img: handwrittenImg1,
      branch: "IT",
      topic: "Object Oriented Programming",
      topperName: "Ashutosh Jha",
    ),
    TopNotesModel(
      img: handwrittenImg2,
      branch: "CSE",
      topic: "Data Structures and Algorithms",
      topperName: "Ankit Sharma",
    ),
    TopNotesModel(
      img: handwrittenImg3,
      branch: "ECE",
      topic: "Digital Signal Processing",
      topperName: "Rahul Singh",
    ),
    TopNotesModel(
      img: handwrittenImg1,
      branch: "EEE",
      topic: "Power Electronics",
      topperName: "Divya Gupta",
    ),
    TopNotesModel(
      img: handwrittenImg2,
      branch: "MEC",
      topic: "Thermodynamics",
      topperName: "Ravi Patel",
    ),
    TopNotesModel(
      img: handwrittenImg3,
      branch: "CIV",
      topic: "Structural Analysis",
      topperName: "Priya Sharma",
    ),
  ];
}
