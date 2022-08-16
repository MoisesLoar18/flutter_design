import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  final Color color;
  final List<Widget> children;
  final double heigh;
  final bool presentation;
  const BackgroundCard({Key? key, required this.color, required this.children, required this.heigh, required this.presentation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: presentation == true ? EdgeInsets.only(top: size.height * 0.1) : EdgeInsets.zero,
      height: heigh,
      child: Padding(
        padding: presentation == true ? const EdgeInsets.all(15.0) : EdgeInsets.zero,
        child: Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 200,
              width: size.width * 1,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(right: -140, top: -190, child: _Bubble(size: size)),
                  Positioned(left: -140, bottom: -190, child: _Bubble(size: size)),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      radius: size.height * .2,
    );
  }
}
