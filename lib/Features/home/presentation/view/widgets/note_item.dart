import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/Features/edit/presentation/view/edit_notes_view.dart';
import '../../../../../core/models/note_model.dart';
import '../../view_model/get_note_cubit/get_note_cubit.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;

  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.6), fontSize: 15),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<GetNoteCubit>(context).getAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(.7), fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
