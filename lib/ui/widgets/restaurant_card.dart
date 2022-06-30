import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/ui/presentation/second_screen.dart';

class Cards extends StatelessWidget {
  final Restaurant restaurants;
  const Cards({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: Hero(
        tag: restaurants.id,
        child: Image.network(restaurants.pictureId),
      ),
      onTap: () => {
        Navigator.pushNamed(context, SecondScreen.routeName,
            arguments: restaurants),
      },
      // title: Text(restaurants.name, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(
                restaurants.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(restaurants.city),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              Text(
                restaurants.rating.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
