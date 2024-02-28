class NoteModel {
  int? id;
  String? title;
  String? description;
  DateTime? date;

  NoteModel({this.id, this.title, this.description, this.date});
}

List<NoteModel> notes = [
  NoteModel(
    title: "First Note",
    description: "This is the first note",
    date: DateTime.now(),
  ),
  NoteModel(
    id: 2,
    title: "Second Note",
    description: "This is the second note",
    date: DateTime.now(),
  ),
  NoteModel(
    id: 3,
    title: "Third Note",
    // description: "This is the third note",
    date: DateTime.now(),
  ),
];
