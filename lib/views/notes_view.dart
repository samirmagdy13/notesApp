import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';
import '../widgets/constant.dart';
import '../widgets/custom_app_bar.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        //centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
            color: Colors.black,
          ),
        ),
      ),
      body: const NotesViewBody(),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        splashColor: Colors.amberAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
