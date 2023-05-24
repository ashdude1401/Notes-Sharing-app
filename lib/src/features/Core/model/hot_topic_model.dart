import 'package:flutter/material.dart';

class HotTopicModel {
  final String branch;
  final String topic;
  final int noOfNotes;
  final VoidCallback? onTap;
  HotTopicModel(
      {required this.branch,
      required this.topic,
      required this.noOfNotes,
      required this.onTap});

  static List<HotTopicModel> hotTopicList = [
    HotTopicModel(branch: "CSE", topic: "DBMS", noOfNotes: 45, onTap: null),
    HotTopicModel(
        branch: "CSE", topic: "Data Structures", noOfNotes: 30, onTap: null),
    HotTopicModel(
        branch: "CSE", topic: "Operating Systems", noOfNotes: 20, onTap: null),
    HotTopicModel(
        branch: "CSE", topic: "Algorithms", noOfNotes: 35, onTap: null),
    HotTopicModel(
        branch: "ECE", topic: "Analog Electronics", noOfNotes: 15, onTap: null),
    HotTopicModel(
        branch: "ECE",
        topic: "Digital Electronics",
        noOfNotes: 25,
        onTap: null),
    HotTopicModel(
        branch: "ECE", topic: "Signal Processing", noOfNotes: 10, onTap: null),
    HotTopicModel(
        branch: "MEC", topic: "Thermodynamics", noOfNotes: 18, onTap: null),
    HotTopicModel(
        branch: "MEC", topic: "Fluid Mechanics", noOfNotes: 12, onTap: null),
    HotTopicModel(
        branch: "MEC",
        topic: "Design and Manufacturing",
        noOfNotes: 22,
        onTap: null),
  ];
}
