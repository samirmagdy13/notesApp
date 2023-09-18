import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/note_model.dart';
import '../../view_model/get_note_cubit/get_note_cubit.dart';
import 'note_item.dart';

class NoteItemBuilder extends StatelessWidget {
  const NoteItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BlocBuilder<GetNoteCubit, GetNoteState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<GetNoteCubit>(context).notes ?? [];
          BlocProvider.of<GetNoteCubit>(context).notesFiltered;
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<GetNoteCubit>(context)
                    .notesFiltered
                    .isEmpty
                ? notes.length
                : BlocProvider.of<GetNoteCubit>(context).notesFiltered.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NoteItem(
                  note: BlocProvider.of<GetNoteCubit>(context)
                          .notesFiltered
                          .isEmpty
                      ? notes[index]
                      : BlocProvider.of<GetNoteCubit>(context)
                          .notesFiltered[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
