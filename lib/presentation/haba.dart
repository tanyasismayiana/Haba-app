import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/theme.dart';

class HabaApp extends StatelessWidget {
  const HabaApp({super.key});

  Widget bottomBarWidget(IconData icona) {
    return Icon(
      icona,
      color: Colors.orange,
    );
  }

  Widget listCard(
      BuildContext context,
      String label,
      String amount,
      String image,
      Color cardColor,
      String streakImage,
      double? height,
      double perc) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      image,
                      height: 35,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(''),
                      Row(
                        children: [
                          Icon(
                            perc > 10
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: perc > 10 ? Colors.green : Colors.red,
                            size: 12,
                          ),
                          const Text('9.8%'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${amount}k',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildChip(
      String label, IconData icona, BuildContext ctx, Color color) {
    return Flexible(
      child: Chip(
        backgroundColor: color,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icona,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottomBarWidget(Icons.credit_card),
                      bottomBarWidget(Icons.graphic_eq_outlined),
                      bottomBarWidget(Icons.notifications),
                      bottomBarWidget(Icons.settings),
                    ],
                  ),
                )),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    color: Colors.grey,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 30,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xfff4f2f0),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Popular tables',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        4,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xfff4f2f0),
                                radius: 35,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '#NFT',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '122 people',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildChip('Today\'s best', Icons.today, context,
                      const Color(0xfff4f2f0)),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                      'My Roundtable', Icons.visibility, context, Colors.white),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Crypto',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    listCard(
                        context,
                        'USDT',
                        '14850',
                        'assets/images/Vector.png',
                        const Color(0xff51af95),
                        'streakImage',
                        35,
                        12),
                    listCard(
                        context,
                        'BUSD',
                        '536',
                        'assets/images/Vector1.png',
                        const Color(0xfff3ba3c),
                        'streakImage',
                        50,
                        7.9),
                    listCard(
                        context,
                        'Cake',
                        '77483',
                        'assets/images/Vector2.png',
                        Colors.white,
                        'streakImage',
                        50,
                        5),
                  ],
                ),
              ),
              Text(
                'Stocks',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    listCard(
                        context,
                        'USDT',
                        '14850',
                        'assets/images/Vector.png',
                        const Color(0xff51af95),
                        'streakImage',
                        35,
                        12),
                    listCard(
                        context,
                        'BUSD',
                        '536',
                        'assets/images/Vector1.png',
                        const Color(0xfff3ba3c),
                        'streakImage',
                        50,
                        9),
                    listCard(
                        context,
                        'Cake',
                        '77483',
                        'assets/images/Vector2.png',
                        Colors.white,
                        'streakImage',
                        50,
                        5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
