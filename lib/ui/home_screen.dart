import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/model/restaurant_list.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
        bottom: PreferredSize(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 12.0,
              left: 14.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Rekomendari Restaurant Buat Kamu!!',
              style: textTheme.subtitle2!.copyWith(color: Colors.white),
            ),
          ),
          preferredSize: const Size.fromHeight(10.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: Consumer<RestaurantProvider>(
        builder: (context, provider, _) {
          ResultState<RestaurantList> state = provider.state;
          switch (state.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    state.message!,
                  ),
                ),
              );
            case Status.hasData:
              {
                List<Restaurant> restaurants = state.data!.restaurants;
                if (restaurants.isEmpty) {
                  return const Center(
                    child: Text('Restaurant Tidak Ada!'),
                  );
                } else {
                  return Cards(
                    restaurants: restaurants,
                  );
                }
              }
          }
        },
      ),
    );
  }
}
