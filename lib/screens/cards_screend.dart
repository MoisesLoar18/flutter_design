import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/custom_card.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = _getRandomColors();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey[200]!, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 18),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text('Online Card', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cards
              SizedBox(
                width: size.width,
                height: 230,
                child: Swiper(
                  containerHeight: 100,
                  itemCount: colors.length,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCard(color: colors[index], presentation: false),
                  ),
                ),
              ),

              // Options
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Card Menu:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CardOption(size: size, icon: Icons.account_balance_wallet, title: 'Top up wallet money'),
                  _CardOption(size: size, icon: Icons.pie_chart, title: 'Create wallet budget'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CardOption(size: size, icon: Icons.settings, title: 'Set wallet limits'),
                  _CardOption(size: size, icon: Icons.lock, title: 'Lock this card'),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                height: size.height * 0.07,
                width: size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.grey[100],
                    // borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey[200]!, width: 2),
                    elevation: 0,
                    primary: Colors.grey[100],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('+ add new card', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<MaterialColor> _getRandomColors() {
    var random = Random();
    var colors = <MaterialColor>[];

    for (var i = 0; i < 10; i++) {
      var color = Colors.primaries[random.nextInt(Colors.primaries.length)][300]!;
      if (color.value != 4294961979) {
        colors.add(Colors.primaries[random.nextInt(Colors.primaries.length)]);
      }
    }

    return colors;
  }
}

class _CardOption extends StatelessWidget {
  const _CardOption({
    Key? key,
    required this.size,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[200]!, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      width: size.width * 0.38,
      height: size.height * 0.19,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 40),
          Text(
            title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
