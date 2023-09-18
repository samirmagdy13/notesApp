import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/models/note_model.dart';

class EditColorItem extends StatefulWidget {
  final NoteModel note;
  const EditColorItem({super.key, required this.note});

  @override
  State<EditColorItem> createState() => _EditColorItemState();
}

class _EditColorItemState extends State<EditColorItem> {
  late int curentIndex;
  @override
  void initState() {
    curentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                curentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isActive: curentIndex == index ? true : false,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;

  const ColorItem({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 34,
          );
  }
}
