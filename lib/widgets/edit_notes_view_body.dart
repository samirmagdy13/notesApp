// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/noteCubit/note_cubit.dart';
import '../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNotesViewBody extends StatefulWidget {
  final NoteModel note;

  const EditNotesViewBody({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
            color: Colors.white,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).getAllNotes();

              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTtextField(
            hintText: widget.note.title,
            onChanged: (val) {
              title = val;
            },
          ),
          const SizedBox(height: 20),
          CustomTtextField(
            hintText: widget.note.subTitle,
            maxlines: 5,
            onChanged: (val) {
              subTitle = val;
            },
          ),
        ],
      ),
    );
  }
}
