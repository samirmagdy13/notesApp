import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../widgets/constant.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  getAllNotes() {
    var notesbox = Hive.box<NoteModel>(kNotesBook);
    notes = notesbox.values.toList();
    emit(NoteSucces());
  }
}
