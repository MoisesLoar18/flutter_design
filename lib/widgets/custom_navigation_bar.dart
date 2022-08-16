import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // const index = 1;

    return SizedBox(
      height: size.height * 0.09,
      width: double.infinity,
      child: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _item(0, active: true),
            _item(1, active: false),
            SizedBox(width: size.width * 0.15),
            _item(2, active: false),
            _item(3, active: false),
          ],
        ),
      ),
    );
  }

  IconButton _item(int index, {bool active = false}) {
    Map<int, List<IconData>> icons = {
      0: [Icons.home, Icons.home_outlined],
      1: [Icons.insert_chart, Icons.insert_chart_outlined],
      2: [Icons.favorite, Icons.favorite_border],
      3: [Icons.person, Icons.person_outline]
    };

    return IconButton(
      icon: Icon(
        active ? icons[index]!.first : icons[index]![1],
        color: active ? Colors.black : null,
        size: active ? 32 : 24,
      ),
      onPressed: () {},
    );
  }
}
