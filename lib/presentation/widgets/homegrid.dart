import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../domain/entities/GridModel.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({super.key});

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  late List<GridModel> gridmodel;

  @override
  void initState() {
    gridmodel = [
      GridModel(
        title: "Balance",
        ontap: () {},
        iconData: Icons.account_balance_wallet_outlined,
      ),
      GridModel(
        title: "Account",
        ontap: () {},
        iconData: Icons.account_balance_outlined,
      ),
      GridModel(
        title: "Notifications",
        ontap: () {},
        iconData: Icons.notification_add_outlined,
      ),
      GridModel(
        title: "Cash",
        ontap: () {},
        iconData: Icons.money_outlined,
      ),
      GridModel(
          title: "Pay Bills", ontap: () {}, iconData: Icons.payment_outlined),
      GridModel(
          title: "Phone Recharge",
          ontap: () {},
          iconData: Icons.phone_android_outlined),
    ];
    super.initState();
  }

  final List titles = [
    "Menu",
    "Services",
  ];
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CardItems(items: gridmodel, title: titles[index]);
                },
              ),
            ]),
          ],
        ));
  }
}

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.items, required this.title});
  final List<GridModel> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      Card(
        elevation: 5,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            return GridItem(model: items[index]);
          },
        ),
      ),
    ]);
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.model});
  final GridModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          model.iconData,
          color: Colors.deepPurple,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          model.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
