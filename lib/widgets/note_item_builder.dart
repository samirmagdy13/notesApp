import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/noteCubit/note_cubit.dart';

import '../models/note_model.dart';
import 'note_item.dart';

class NoteItemBuilder extends StatelessWidget {
  const NoteItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NoteCubit>(context).notes ?? [];

          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: notes.length,

            // itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NoteItem(note: notes[index]),
              );
            },
          );
        },
      ),
    );
  }
}
