import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../../../core/models/note_model.dart';
import '../../../../../constant.dart';
part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  List<NoteModel>? notes;
  getAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesBook);
    notes = notesbox.values.toList();
    emit(GetNoteSucces());
  }

  List<NoteModel> notesFiltered = [];
  void filterNotes({required String input}) {
    notesFiltered = notes!
        .where((element) => element.title
            .toString()
            .toLowerCase()
            .startsWith(input.toLowerCase()))
        .toList();
    emit(GetNoteSucces());
  }
}
