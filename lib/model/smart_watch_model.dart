import 'package:flutter/material.dart';

class SmartWatchModel {
  final String image;
  final String title;
  final double price;
  final Color bgColor;
  final Color? color;

  SmartWatchModel({
    required this.image,
    required this.title,
    required this.price,
    required this.bgColor,
    this.color,
  });
}
