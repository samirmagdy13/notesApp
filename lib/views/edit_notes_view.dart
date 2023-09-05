import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../widgets/edit_notes_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;

  const EditNoteView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(note: note),
    );
  }
}
