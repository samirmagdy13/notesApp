import 'package:flutter/material.dart';
import 'note_item_builder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Expanded(child: NoteItemBuilder()),
        ],
      ),
    );
  }
}
