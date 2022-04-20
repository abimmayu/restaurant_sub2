import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, data) {
          late List<Restaurant> restaurant = parseRestaurant(data.data);
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildList(context, restaurant[index]);
            },
            itemCount: restaurant.length,
          );
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurant);
      },
      child: ListTile(
        leading: Container(
          width: 100,
          height: 110,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(restaurant.pictureId),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        title: Text(restaurant.name),
        subtitle: Column(
          children: [
            Text(
              restaurant.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Text(restaurant.rating)
              ],
            ),
            const SizedBox(height: 2),
            const Divider()
          ],
        ),
      ),
    );
  }
}
