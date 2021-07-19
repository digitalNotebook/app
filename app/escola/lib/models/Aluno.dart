import 'package:flutter/foundation.dart';

class Aluno {
  final String? fullName;
  final DateTime? dtNasc;
  final String? id;

  Aluno({
    @required this.fullName,
    this.dtNasc,
    this.id,
  });
}
