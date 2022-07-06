import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/ui/widgets/result_card.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String queries = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search Restaurant')),
        body: SafeArea(
          child: Column(children: [
            _searchBar(),
            const SizedBox(height: 8),
            Expanded(
              child: Consumer<SearchRestaurantProvider>(
                  builder: (context, value, _) {
                if (value.resultState == ResultState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (value.resultState == ResultState.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.restaurantSearch!.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant =
                            value.restaurantSearch!.restaurants[index];
                        return CardResult(restaurants: restaurant);
                      });
                } else if (value.resultState == ResultState.noData) {
                  return Center(child: Text(value.message));
                } else if (value.resultState == ResultState.error) {
                  return Center(child: Text(value.message));
                } else {
                  return const Center(child: Text(''));
                }
              }),
            )
          ]),
        ));
  }

  Widget _searchBar() {
    return Consumer<SearchRestaurantProvider>(builder: (context, state, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "Cari makanan dan minuman favoritmu",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintStyle: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              maxLines: 1,
              controller: _searchController,
              onChanged: (String query) {
                if (query.isNotEmpty) {
                  setState(() {
                    queries = query;
                  });
                  state.fetchSearch(query);
                }
              },
            ),
          ),
        ),
      );
    });
  }
}
