import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          Colors.black,
          Colors.black87,
        ],
      ),
    );

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: boxDecoration,
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SvgPicture.asset('assets/logo.svg', height: 30),
                ),
                Positioned(left: -(size.width * 0.3), top: 50, child: Transform.rotate(angle: -.06, child: const CustomCard(color: Color.fromRGBO(132, 47, 216, 1), presentation: true))),
                Positioned(right: -(size.width * 0.3), child: Transform.rotate(angle: .18, child: const CustomCard(color: Color.fromRGBO(55, 131, 251, 1), presentation: true))),
                // const CustomCard(color: Colors.indigo),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.55),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Create your \nown card here',
                          style: TextStyle(color: Colors.white, fontSize: 45),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Billy is the best solution to monitor all your financial activities.',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    color: Colors.white38,
                    onPressed: () => Navigator.pushNamed(context, 'home'),
                    child: const Text('Skip', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
