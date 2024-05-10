import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_model/get_note_cubit/get_note_cubit.dart';

class HomeAppBarTittle extends StatefulWidget {
  const HomeAppBarTittle({Key? key}) : super(key: key);

  @override
  State<HomeAppBarTittle> createState() => _HomeAppBarTittleState();
}

class _HomeAppBarTittleState extends State<HomeAppBarTittle> {
  final FocusNode searchFocusNode = FocusNode();
  var textController = TextEditingController();
  bool searchOpened = false;

  @override
  void dispose() {
    textController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

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
                      hintText: 'Search by tittle',
                      focusNode: searchFocusNode,
                      enabledBorderColor: InputBorder.none,
                      controller: textController,
                      onChanged: (input) {
                        BlocProvider.of<GetNoteCubit>(context)
                            .filterNotes(input: textController.text);
                      },
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
                Future.delayed(const Duration(milliseconds: 20), () {
                  FocusScope.of(context).requestFocus(searchFocusNode);
                });
              } else {
                searchFocusNode.unfocus();
                textController.clear();
                BlocProvider.of<GetNoteCubit>(context).notesFiltered.clear();

                // BlocProvider.of<GetNoteCubit>(context).filterNotes(input: '');
              }
            },
          ),
        ],
      ),
    );
  }
}
