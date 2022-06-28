import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/common/navigation_app.dart';
import 'package:restaurant_app/ui/detail_screen.dart';

class Cards extends StatefulWidget {
  final List<Restaurant> restaurants;
  const Cards({Key? key, required this.restaurants}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Widget _buildItem(BuildContext context, Restaurant restaurants) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: Hero(
        tag: restaurants.id,
        child: Image.network(restaurants.mediumPictureUrl),
      ),
      onTap: () => {
        NavigationApp.intentWithData(DetailScreen.routeName, restaurants.id),
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

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Restaurant restaurants = widget.restaurants[index];
        return _buildItem(context, restaurants);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
          color: Colors.black26,
        );
      },
      itemCount: widget.restaurants.length,
    );
  }
}
