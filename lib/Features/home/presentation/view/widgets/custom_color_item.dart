import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/add_note_cubit/add_note_cubit.dart';

class ColorBuilderItem extends StatefulWidget {
  const ColorBuilderItem({super.key});

  @override
  State<ColorBuilderItem> createState() => _ColorBuilderItemState();
}

class _ColorBuilderItemState extends State<ColorBuilderItem> {
  int curentIndex = 0;
  List<Color> colors = const [
    Color(0xffFFCC80),
    Color(0xffF6EEE0),
    Color(0xffC5C5C5),
    Color(0xff949B96),
    Color(0xff829191),
    Color(0xff4c5b61),
    Color(0xff6d696a),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: colors.length,

        // itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                curentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    colors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isActive: curentIndex == index ? true : false,
                color: colors[index],
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
