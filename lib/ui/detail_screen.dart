import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/ui/widgets/platform_widgets.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';
  final String restaurants;

  const DetailScreen({Key? key, required this.restaurants}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    Future.microtask(
      () {
        RestaurantDetailProvider provider =
            Provider.of<RestaurantDetailProvider>(
          context,
          listen: false,
        );
        provider.getDetail(
          widget.restaurants,
        );
      },
    );
  }

  Widget _buildDetails(BuildContext context) {
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
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, provider, _) {
          ResultState<RestaurantDetail> state = provider.state;
          switch (state.status) {
            case Status.loading:
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Loading...'),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case Status.error:
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.message!,
                    ),
                  ),
                ),
              );
            case Status.hasData:
              {
                Restaurant restaurants = state.data!.restaurant;
                return Scaffold(
                  body: NestedScrollView(
                    headerSliverBuilder: (context, isScroller) {
                      return [
                        SliverAppBar(
                          pinned: true,
                          expandedHeight: 200,
                          iconTheme: const IconThemeData(
                            color: Colors.white,
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            background: Hero(
                              tag: restaurants.id,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      restaurants.mediumPictureUrl,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              restaurants.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            centerTitle: true,
                            titlePadding: const EdgeInsets.only(bottom: 16.0),
                          ),
                        ),
                      ];
                    },
                    body: ListView(
                      padding: const EdgeInsets.all(10),
                      children: [
                        const Divider(
                          height: 12,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: Colors.red[400],
                            ),
                            Text('${restaurants.address}, '),
                            Text(restaurants.city),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_outlined,
                                color: Colors.yellow),
                            Text('  ${restaurants.rating.toString()}'),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text(restaurants.description),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Makanan: '),
                              _buildFood(context, restaurants.menus.foods),
                              const Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                              const Text('Minuman: '),
                              _buildDrink(context, restaurants.menus.drinks),
                              const Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Widget _buildFood(BuildContext context, List<Food> food) {
    return Column(
      children: [
        SizedBox(
          height: 7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: food.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(food[index].name),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDrink(BuildContext context, List<Drink> drink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: drink.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(drink[index].name),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return _buildDetails(context);
  }

  Widget _buildIos(BuildContext context) {
    return _buildDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    return Platform(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }
}
