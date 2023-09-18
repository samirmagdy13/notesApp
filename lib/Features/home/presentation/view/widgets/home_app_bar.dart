import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Features/home/presentation/view_model/get_note_cubit/get_note_cubit.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final FocusNode searchFocusNode = FocusNode();
  bool searchOpened = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchOpened == false
              ? const Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomTtextField(
                      hintText: 'Search',
                      focusNode: searchFocusNode,
                      enabledBorderColor: InputBorder.none,
                    ),
                  ),
                ),
          CustomSearchIcon(
            icon: searchOpened == false ? Icons.search : Icons.clear,
            color: Colors.black,
            onPressed: () {
              setState(() {
                searchOpened = !searchOpened;
              });

              if (searchOpened) {
                // Delay the focus request slightly to ensure visibility
                Future.delayed(const Duration(milliseconds: 50), () {
                  FocusScope.of(context).requestFocus(searchFocusNode);
                });
              } else {
                searchFocusNode.unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
      //         var notes =BlocProvider.of<GetNoteCubit>(context).notes;
      // var notesFiltered = notes!.where((element) => element.title.toString().toLowerCase().startsWith(input.toLowerCase())).toList();
              