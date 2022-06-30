import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/widgets/restaurant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantListProvider>(
      builder: ((context, value, _) {
        if (value.resultState == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (value.resultState == ResultState.hasData) {
            return Scaffold(
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: value.restaurant.restaurants.length,
                itemBuilder: (BuildContext context, index) {
                  var restaurants = value.restaurant.restaurants[index];
                  return Cards(restaurant: restaurants);
                },
              ),
            );
          } else if (value.resultState == ResultState.noData) {
            return Center(
              child: Text(value.message),
            );
          } else if (value.resultState == ResultState.error) {
            return Center(
              child: Text(value.message),
            );
          } else {
            return const Center(
              child: Text(""),
            );
          }
        }
      }),
    );
  }
}
