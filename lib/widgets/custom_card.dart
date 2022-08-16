import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/background_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.color, required this.presentation}) : super(key: key);

  final Color color;
  final bool presentation;

  @override
  Widget build(BuildContext context) {
    return BackgroundCard(
      presentation: presentation,
      heigh: 300,
      color: color,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Current Balance',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$4,5780,80',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const ContentCard(
          align: Alignment.bottomLeft,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('52941 2438 4780 2468', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        const ContentCard(
          align: Alignment.topRight,
          children: [
            Text('12/24', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        ContentCard(
          align: Alignment.bottomRight,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/logo_card.svg',
              height: 30,
            ),
          ],
        ),
      ],
    );
  }
}

class ContentCard extends StatelessWidget {
  final AlignmentGeometry align;
  final MainAxisAlignment? mainAxisAlignment;
  final List<Widget> children;

  const ContentCard({
    Key? key,
    required this.align,
    this.mainAxisAlignment,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: align,
      child: mainAxisAlignment != null
          ? Column(
              mainAxisAlignment: mainAxisAlignment!,
              children: children,
            )
          : Column(
              children: children,
            ),
    );
  }
}
