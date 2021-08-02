import 'package:flutter/material.dart';

enum Status {
  DONE,
  UNDONE,
}

class Aula with ChangeNotifier {
  final String id;
  final String title;
  final String subtitle;
  final String imagesUrl;
  final DateTime dataAula;
  final String description;
  final String videoUrl;
  final Status status;
  bool isFavorite;

  Aula({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagesUrl,
    required this.dataAula,
    required this.description,
    required this.videoUrl,
    required this.status,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
