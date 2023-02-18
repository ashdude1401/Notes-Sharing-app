import 'dart:ui';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;
  final String counterText;
  final Color bgColor;
  final double size;

  OnBoardingModel(
      this.image, this.title, this.subtitle, this.bgColor,
      this.counterText, this.size);
}
