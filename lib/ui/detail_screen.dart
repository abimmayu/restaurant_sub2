// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  final Restaurant restaurant;

  const DetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(restaurant.pictureId),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  restaurant.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_city),
                        Text(restaurant.city),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(restaurant.rating)
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(restaurant.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    children: restaurant.menus.foods
                        .map((e) => Text(e.name))
                        .toList()),
                Column(
                  children:
                      restaurant.menus.drinks.map((e) => Text(e.name)).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
