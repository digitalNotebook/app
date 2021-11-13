import 'package:escola/models/subject.dart';

abstract class IProvider {
  List<Subject> getAll();
  Subject findById(String id);
}
