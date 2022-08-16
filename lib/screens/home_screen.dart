import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final names = ['John', 'Jane', 'Jack', 'Jill', 'Fan', 'John', 'Jane', 'Jack', 'Jill', 'Fan', 'John', 'Jane', 'Jack', 'Jill', 'Fan', 'John', 'Jane', 'Jack', 'Jill', 'Fan'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, 'credit_cards'), child: const Icon(Icons.flip)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Header
                const _Header(),
                const SizedBox(height: 20),

                // Body: Current Balance
                BackgroundCard(
                  color: Colors.black,
                  heigh: 110,
                  presentation: false,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Current Balance', style: TextStyle(fontSize: 14, color: Colors.white)),
                              Text('\$4,570,80', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(10),
                              primary: Colors.white, // <-- Button color
                            ),
                            child: const Icon(Icons.add, color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Body: Color Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CardItems(size: size, icon: Icons.near_me, title: 'Send', color: Colors.blue),
                    _CardItems(size: size, icon: Icons.account_balance_wallet, title: 'Card', color: Colors.deepPurple),
                    _CardItems(size: size, icon: Icons.grid_view_rounded, title: 'More', color: Colors.orange),
                  ],
                ),
                const SizedBox(height: 20),

                // Body: List Users
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: Image(
                                    image: NetworkImage('https://randomuser.me/api/portraits/thumb/women/$index.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(names[index], style: const TextStyle(fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Body: Enterprises - Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Recent activity', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('See all', style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),

                // Body: Enterprises - ListTiles
                const _EnterpriseItem(photo: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Amazon_icon.png', amount: '\$299.00', date: '08 Jan, 2022', name: 'Amazon bill'),
                const _EnterpriseItem(photo: 'https://cdn.pixabay.com/photo/2021/04/16/22/17/logo-6184540_1280.png', amount: '\$42.99', date: '08 Jan, 2022', name: 'Amazon bill'),
                const _EnterpriseItem(photo: 'https://cdn-icons-png.flaticon.com/512/25/25231.png', amount: '\$378.20', date: '08 Jan, 2022', name: 'Amazon bill'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EnterpriseItem extends StatelessWidget {
  const _EnterpriseItem({
    Key? key,
    required this.name,
    required this.date,
    required this.amount,
    required this.photo,
  }) : super(key: key);

  final String name;
  final String date;
  final String amount;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
        child: Image(image: NetworkImage(photo), fit: BoxFit.fitHeight, height: 30),
      ),
      title: Text(name),
      subtitle: Text(date, style: const TextStyle(fontSize: 12)),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class _CardItems extends StatelessWidget {
  const _CardItems({
    Key? key,
    required this.size,
    required this.color,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Size size;
  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      width: size.width * .26,
      height: size.height * 0.16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white30,
            radius: size.width * 0.06,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello George', style: TextStyle(color: Colors.black45, fontSize: 14.0)),
            SizedBox(height: 3),
            Text('Welcome Back!', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        Ink(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey[200]!, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            child: const Icon(Icons.notifications_none_rounded),
            onTap: () {},
          ),
        )
      ],
    );
  }
}
