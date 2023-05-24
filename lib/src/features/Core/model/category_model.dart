import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/image_strings.dart';

class CategoryModel {
  final String branch;
  final int noOfTopic;
  final int noOfNotes;
  final String img;
  final VoidCallback? onTap;

  CategoryModel(
      {required this.branch,
      required this.noOfNotes,
      required this.noOfTopic,
      required this.onTap,
      required this.img});

  static List<CategoryModel> categoryList = [
    CategoryModel(
      branch: "CSE".substring(0, 3),
      noOfNotes: 78,
      noOfTopic: 24,
      onTap: null,
      img:categoriesCardImg1,
    ),
    CategoryModel(
      branch: "ECE".substring(0, 3),
      noOfNotes: 42,
      noOfTopic: 16,
      onTap: null,
      img:categoriesCardImg1,
    ),
    CategoryModel(
      branch: "MEC".substring(0, 3),
      noOfNotes: 62,
      noOfTopic: 19,
      onTap: null,
      img:categoriesCardImg1,
    ),
    CategoryModel(
      branch: "CIV".substring(0, 3),
      noOfNotes: 35,
      noOfTopic: 12,
      onTap: null,
      img: categoriesCardImg1,
    ),
  ];
}
