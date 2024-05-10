import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constant.dart';
import '../../../../../core/models/note_model.dart';


part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int color = const Color(0xffFFCC80).value;

  addNote({required String title,required String subTitle} ) async {
    emit(AddNoteLoading());
    try {
      var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      NoteModel note = NoteModel(
        title: title,
        subTitle: subTitle,
        date: date,
        color:color,
      );
      var notesbox = Hive.box<NoteModel>(kNotesBook);
      await notesbox.add(note);
      emit(AddNoteSucces());
    } catch (e) {
      emit(AddNoteFailure(errMessege: e.toString()));
    }
  }
}
