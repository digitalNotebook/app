class Aluno {
  final String id;
  final String fullName;
  final DateTime dtNasc;
  final String profilePictureUrl;

  Aluno(
      {required this.fullName,
      required this.dtNasc,
      required this.id,
      required this.profilePictureUrl});
}
